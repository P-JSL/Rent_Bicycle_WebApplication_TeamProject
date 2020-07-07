package com.rental.controller;

import java.io.File;
import java.util.HashMap;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rental.domain.Criteria;
import com.rental.domain.PageDTO;
import com.rental.domain.ProductVO;
import com.rental.domain.ResTableVO;
import com.rental.service.MemberService;
import com.rental.service.ProductService;
import com.rental.service.ResTableService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping(value = "/product/*")
public class ProductControll {
	@Setter(onMethod_ = { @Autowired })
	private ProductService service;

	@Setter(onMethod_ = { @Autowired })
	private ResTableService rs;
	@Setter(onMethod_ = { @Autowired })
	private MemberService ms;

	@GetMapping("/product")
	public void product(Model model, @ModelAttribute("cri") Criteria cri) {
		log.info("productlist");
		int total = service.count();
		model.addAttribute("product", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));// total
	}

	@GetMapping("/productSearch")
	public String productSearch(Model model, @RequestParam("startdate") String startdate,
			@RequestParam("enddate") String enddate) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("startdate", startdate);
		map.put("enddate", enddate);
		model.addAttribute("product", service.productSearch(map));
		return "product/product";
	}

	@GetMapping("/write")
	public void productregister(String userid,Model model) {
		log.info("product writing");
		model.addAttribute("user",ms.read(userid));

	}

	/*
	 * @RequestMapping("/insert") public void insert() {
	 * System.out.println("insert method ok"); }
	 * 
	 * @RequestMapping("/delete") public void delete() {
	 * System.out.println("delete method ok"); }
	 */

	@PostMapping("/write")
	public String productregisterAction(ProductVO product, RedirectAttributes rttr) {
		log.info("productregisterAction");

		MultipartFile multipartFile = product.getGoodsfile();

		String uploadFolder = "c:\\upload\\product";

		log.info("upload file name : " + multipartFile.getOriginalFilename());
		log.info("upload file size : " + multipartFile.getSize());

		String uploadFileName = multipartFile.getOriginalFilename();
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("//") + 1);

		log.info(uploadFileName);

		UUID uuid = UUID.randomUUID();
		uploadFileName = uuid.toString() + "_" + uploadFileName;

		File saveFile = new File(uploadFolder, uploadFileName);

		try {
			multipartFile.transferTo(saveFile);
			// ����� ����
		} catch (Exception e) {
			log.error(e.getMessage());
		}

		product.setGoodsphoto(uploadFileName);
		service.insert(product);
		rttr.addFlashAttribute("result", product.getNum());
		return "redirect:/product/product";
	}

	@GetMapping("/view")
	public void view(String userid, Model model, int num, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("userid", userid);
		model.addAttribute("view", service.getPage(num));
	}

	@GetMapping("/reservation")
	public String reservation(ResTableVO rsvo, RedirectAttributes rttr) {
		rs.insert(rsvo);

		for (ProductVO pvo : service.AllList()) {
			if (pvo.getMany() > 0 && pvo.getStatus() != 0) {
				service.notmany(rsvo.getN_num());
				if (pvo.getMany() == 0) {
					service.statusminus(rsvo.getN_num());
					rttr.addFlashAttribute("NoRes", "<script>alert('예약 불가입니다.')</script>");
					return "redirect:/product/product";
				}
			}

		}
		rttr.addAttribute("userid", rsvo.getUserid());
		return "redirect:/users/Reservation";
	}

	@GetMapping("/cart")
	public void cart(String userid, Model model) {
		model.addAttribute("userid", userid);
		int cartcount = 0;
		int[] cartprice = new int[10];
		int cartpsum = 0;
		int[] cnumlist = new int[10];
		for (ProductVO pvo : service.cartlist(userid)) {
			cartprice[cartcount] = pvo.getPrice();
			cnumlist[cartcount] = pvo.getNum();
			System.out.println("가격" + cartprice[cartcount]);
			System.out.println("카트번호:" + cnumlist[cartcount]);
			cartpsum += cartprice[cartcount];
			cartcount++;
		}
		System.out.println("총가격:" + cartpsum);
		model.addAttribute("cartsum", cartpsum);
		model.addAttribute("cartcount", cartcount);
		model.addAttribute("cartlist", service.cartlist(userid));
	}

	@GetMapping("/cartdelete")
	public String cartdelete(RedirectAttributes rttr, @RequestParam("num") int num,
			@RequestParam("userid") String userid) {
		service.deletecart(num);
		rttr.addAttribute("userid", userid);
		return "redirect:/product/cart";
	}

	@GetMapping("/cartbuy")
	public String cartbuy(@RequestParam("cnumlist") int[] cnumlist, RedirectAttributes rttr) {
		ProductVO pvo = new ProductVO();
		for (int num : cnumlist) {
			pvo = service.searchcart(num);
			service.insertrescart(pvo);
		}

		return "redirect:/users/Reservation";
	}

	@GetMapping("/cartinsert")
	public String cartinsert(Model model, ProductVO pvo, RedirectAttributes rttr) {
		log.info("cart : pvo : " + pvo);
		service.insertrescart(pvo);
		rttr.addAttribute("userid", pvo.getUserid());
		return "redirect:/product/cart";
	}

}
