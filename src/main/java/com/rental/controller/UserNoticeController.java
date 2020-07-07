package com.rental.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
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
import com.rental.domain.Criteria_c;
import com.rental.domain.PageDTO;
import com.rental.domain.PageDTO_c;
import com.rental.domain.ReplyVO;
import com.rental.domain.UserNoticeVO;
import com.rental.service.MemberService;
import com.rental.service.ReplyService;
import com.rental.service.UserNoticeService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/usernotice/*")
@Log4j
public class UserNoticeController {
	// ---------------------------------------------------------------06/24
	@Setter(onMethod_ = { @Autowired })
	private UserNoticeService service;

	@Setter(onMethod_ = { @Autowired })
	private ReplyService rs;
	@Setter(onMethod_ = { @Autowired })
	private MemberService mem;

	@GetMapping("/Usernotice")
	public String usernotice(String userid, Model model, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("userid", userid);
		model.addAttribute("count", service.NoticeCount());
		model.addAttribute("list", service.List(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.NoticeCount()));
		return "board/user/usernotice";
	}

	@GetMapping("/UserWrite")
	public String userwrite(Model model,String userid) {
			if(userid==null) {
				model.addAttribute("user","false");
			}else {
				model.addAttribute("user",mem.read(userid));
			}
		return "board/user/userwrite";
	}

	@PostMapping("/Userwrite")
	public String Userwrite(UserNoticeVO uvo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("UserWrite");

		MultipartFile multipartFile = uvo.getGoodsfile();

		String uploadFolder = "c:\\upload\\upload";

		log.info("upload file name : " + multipartFile.getOriginalFilename());
		log.info("upload file size : " + multipartFile.getSize());

		String uploadFileName = multipartFile.getOriginalFilename();
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("//") + 1);

		log.info(uploadFileName);

		UUID uuid = UUID.randomUUID();
		uploadFileName = uuid.toString() + "_" + uploadFileName;

		File saveFile = new File(uploadFolder, uploadFileName);
		if (!saveFile.isDirectory() || !saveFile.exists()) {
			saveFile.mkdirs();
		}
		try {
			multipartFile.transferTo(saveFile);
			// ����� ����
		} catch (Exception e) {
			log.error(e.getMessage());
		}

		uvo.setGoodsphoto(uploadFileName);
		service.insert(uvo);
		rttr.addFlashAttribute("result", uvo.getNum());
		return "redirect:/usernotice/Usernotice";
	}

	@GetMapping("/Userview")
	public void view(String userid, Model model, UserNoticeVO uvo, int num, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("userid", userid);
		model.addAttribute("view", service.getPage(uvo));
	}

	@GetMapping("/UserView")
	public String view(int sequence, Model model, String userid, @RequestParam("pageNum") int pageNum,
			@ModelAttribute("cri_c") Criteria_c cri_c) {

		Map<String, Object> replymap = new HashMap<String, Object>();
		replymap.put("pageNum", cri_c.getPageNum_c());
		replymap.put("amount", cri_c.getAmount_c());
		replymap.put("n_num", sequence);
		service.viewcount(sequence);

		model.addAttribute("vo", service.viewer(sequence));
		model.addAttribute("userid", userid);
		model.addAttribute("reply", rs.replyList(replymap));
		model.addAttribute("pageMaker", new PageDTO_c(cri_c, rs.count(sequence)));
		model.addAttribute("cri_c", cri_c);
		model.addAttribute("sequence", sequence);
		return "board/user/userview";
	}

	@GetMapping("/Usermodify")
	public String modify(int sequence, String userid, Model model) {
		model.addAttribute("vo", service.viewer(sequence));
		model.addAttribute("userid", userid);
		return "board/user/Usermodify";
	}

	@PostMapping("/Usermodify")
	public String modify(UserNoticeVO uvo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("UserModify");
		MultipartFile multipartFile = null;
		System.out.println(uvo.getGoodsphoto());
		System.out.println(uvo.getGoodsfile().getOriginalFilename());
		if(uvo.getGoodsfile() != null) {
			
			multipartFile = uvo.getGoodsfile();
			log.info("upload file name : " + multipartFile.getOriginalFilename());
			log.info("upload file size : " + multipartFile.getSize());
		}

		String uploadFolder = "c:\\upload\\upload";

	String uploadFileName = "";
		if(uvo.getGoodsfile() != null) {
			 uploadFileName = multipartFile.getOriginalFilename();
		}else {
			uploadFileName = uvo.getGoodsphoto();
		}
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("//") + 1);

		log.info(uploadFileName);

		UUID uuid = UUID.randomUUID();
		uploadFileName = uuid.toString() + "_" + uploadFileName;

		File saveFile = new File(uploadFolder, uploadFileName);
		if (!saveFile.isDirectory() || !saveFile.exists()) {
			saveFile.mkdirs();
		}else {
			saveFile.delete();
		}
		try {
			multipartFile.transferTo(saveFile);
			// ����� ����
		} catch (Exception e) {
			log.error(e.getMessage());
		}

		uvo.setGoodsphoto(uploadFileName);
		service.update(uvo);
		rttr.addFlashAttribute("result", uvo.getNum());
		return "redirect:/usernotice/Usernotice";
	}

	@GetMapping("/Userreply")
	public String reply(ReplyVO rvo, RedirectAttributes rttr) {
		rs.insert(rvo);
		rttr.addAttribute("sequence", rvo.getN_num());

		return "redirect:/usernotice/Userview";
	}

	@GetMapping("/Userdelete")
	public String delete(int sequence) {
		service.delete(sequence);
		return "redirect:/usernotice/Usernotice";
	}

}
