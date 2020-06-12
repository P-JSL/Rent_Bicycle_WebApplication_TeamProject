package com.rental.controller;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rental.domain.Criteria;
import com.rental.domain.PageDTO;
import com.rental.domain.ProductVO;
import com.rental.domain.ResTableVO;
import com.rental.service.ProductService;
import com.rental.service.ResTableService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/product/*")
public class ProductControll {
	@Setter(onMethod_ = { @Autowired })
	private ProductService service;

	@Setter(onMethod_ = { @Autowired })
	private ResTableService rs;

	@GetMapping("/product")
	public void product(Model model,@ModelAttribute("cri") Criteria cri) {
		log.info("productlist");
		log.info(service.getList(cri));
		int total = service.count();
		model.addAttribute("product", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));// total
	}

	@GetMapping("/write")
	public void productregister() {
		log.info("product writing");

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

		String uploadFolder = "c:\\upload";

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
	public void view(String userid, Model model, int num,@ModelAttribute("cri") Criteria cri) {
		model.addAttribute("userid", userid);
		model.addAttribute("view", service.getPage(num));
	}

	@GetMapping("/reservation")
	public String reservation(ResTableVO rsvo, RedirectAttributes rttr) {
		rs.insert(rsvo);

		for (ProductVO pvo : service.AllList()) {
			if (pvo.getMany() > 0 && pvo.getStatus() != 0) {
				service.notmany(rsvo.getN_num());
				
			}

		}
		rttr.addAttribute("userid", rsvo.getUserid());
		return "redirect:/users/Reservation";
	}

//
////
//	private String file(ProductVO product, String uploadFileName) {
//
//		String uploadFileNames = "";
//		MultipartFile multipartFile = null;
//		String uploadFolder = "c:\\upload1";
//		uploadFileNames = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
//
//		UUID uuid = UUID.randomUUID();
//		File saveFile = null;
//
//		uploadFileNames = uuid.toString() + "_" + uploadFileNames;
//		log.warn(product == null);
//		if (product == null) {
//			uploadFileNames =uuid.toString() + "_" + uploadFileName;
//		} else {
//			multipartFile = product.getUploadFile();
//			uploadFileNames = multipartFile.getOriginalFilename();
//
//			saveFile = new File(uploadFolder, uploadFileNames);
//			if (saveFile.exists()) {
//				saveFile.delete();
//			}
//		}
//
//		try {
//			multipartFile.transferTo(saveFile);// saveFile
//
//		} catch (Exception e) {
//			log.error(e.getMessage());
//		} // end catch
//		return uploadFileNames;
//	}

}
