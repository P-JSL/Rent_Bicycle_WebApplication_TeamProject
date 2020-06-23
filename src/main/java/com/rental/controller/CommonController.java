package com.rental.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.transaction.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.web.util.matcher.IpAddressMatcher;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rental.domain.ConTactVO;
import com.rental.domain.Criteria;
import com.rental.domain.Criteria_c;
import com.rental.domain.MemberVO;
import com.rental.domain.NoticeVO;
import com.rental.domain.PageDTO;
import com.rental.domain.PageDTO_c;
import com.rental.domain.QnAVO;
import com.rental.domain.ReplyVO;
import com.rental.domain.ReviewVO;
import com.rental.mapper.ReviewMapper;
import com.rental.service.ConTactService;
import com.rental.service.MemberService;
import com.rental.service.NoticeService;
import com.rental.service.QNAService;
import com.rental.service.ReplyService;
import com.rental.util.Utility;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/*")
public class CommonController {

	protected Transaction trans;

	@Setter(onMethod_ = { @Autowired })
	private MemberService service;

	@Setter(onMethod_ = { @Autowired })
	private ReplyService rs;

	@Setter(onMethod_ = { @Autowired })
	private QNAService qs;

	@Setter(onMethod_ = { @Autowired })
	private ReviewMapper rw;

	@Setter(onMethod_ = { @Autowired })
	private ConTactService cs;

	@GetMapping("/CustomLogin")
	public void loginInput(String error, String logout, Model model) {
		log.info("error : " + error);
		log.info("logout : " + logout);
		if (error != null) {
			model.addAttribute("error", "아이디 혹은 비밀번호가 틀리셨습니다.");
		}
		if (logout != null) {
			model.addAttribute("logout", "로그아웃 하셨습니다.");
		}
	}

	@GetMapping("/signup")
	public void signup() {

	}

	@PostMapping("/signup")
	public String signup(MemberVO memvo, HttpServletRequest request) throws UnsupportedEncodingException, SQLException {

		memvo.setIp(Utility.ip(request));
		
		if (service.signup(memvo)) {
			service.Account_loginto(memvo.getUserid());
			log.info("sign up success");
			return "redirect:/CustomLogin";
		}

		return "redirect:/signup";
	}

	@GetMapping("/review/photo")
	public String photo(Criteria cri, Model model) {
		model.addAttribute("list", rw.llst(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, rw.count()));
		log.info("photo");

		return "review/photo";
	}

	@GetMapping("/review/write")
	public void write() {

	}

	@PostMapping("/review/write")
	public String writereview(ReviewVO rvo) {
		MultipartFile multi = rvo.getPhotos();
		String Path = "C:\\upload\\review";
		log.info(rvo);
		String FileName = multi.getOriginalFilename().substring(multi.getOriginalFilename().lastIndexOf("\\") + 1);
		FileName = UUID.randomUUID().toString().substring(0, 10) + "_" + FileName;
		File file = new File(Path, FileName);
		if (file.isFile()) {
			file.mkdirs();
		}
		try {
			multi.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		rvo.setPhoto(FileName);
		rw.insert(rvo);
		return "redirect:/review/photo";
	}

	@GetMapping("/QnA/QnA")
	public void Qna(Model model, Criteria cri) {
		model.addAttribute("list", qs.list(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, qs.count()));
		log.info("qna");
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/QnA/write")
	public void QnaWrite(String userid, Model model) {

		model.addAttribute("userid", userid);
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/QnA/write")
	public String inWrite(QnAVO qvo, Model model, RedirectAttributes rttr) {
		rttr.addAttribute("userid", qvo.getWriter());
		qs.insert(qvo);
		return "redirect:/QnA/QnA";
	}

	@GetMapping("/QnA/view")
	public void viewer(QnAVO qvo, Model model) {
		model.addAttribute("qna", qs.getPage(qvo));
	}

	@GetMapping("/product/goods")
	public void goods() {
		log.info("goods");
	}

	@RequestMapping(value = "/product/product_show")
	public String productpage() {
		return "product/product_show";
	}

	// NoticService
	@Setter(onMethod_ = { @Autowired })
	private NoticeService noticeservice;

	@GetMapping("/board/notice")
	public String board(String userid, Model model, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("userid", userid);
		model.addAttribute("count", noticeservice.NoticeCount());
		model.addAttribute("list", noticeservice.List(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, noticeservice.NoticeCount()));
		return "board/notice";
	}

	@PostAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/board/write")
	public String board_write(String userid, Model model) {
		model.addAttribute("userid", userid);

		return "board/write";
	}

	@PostAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/board/write")
	public String board_insert(NoticeVO nvo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		noticeservice.insert(nvo);

		return "redirect:/board/notice";
	}

	@PreAuthorize("permitAll")
	@GetMapping("/board/view")
	public String view(int sequence, Model model, String userid, @RequestParam("pageNum") int pageNum,@ModelAttribute("cri_c") Criteria_c cri_c) {
		
		Map<String, Object> replymap = new HashMap<String, Object>();
		replymap.put("pageNum", cri_c.getPageNum_c());
		replymap.put("amount", cri_c.getAmount_c());
		replymap.put("n_num", sequence);
		noticeservice.viewcount(sequence);
		
		model.addAttribute("vo", noticeservice.viewer(sequence));
		model.addAttribute("userid", userid);
		model.addAttribute("reply", rs.replyList(replymap));
		model.addAttribute("pageMaker",new PageDTO_c(cri_c, rs.count(sequence)));
		model.addAttribute("cri_c", cri_c);
		model.addAttribute("sequence", sequence);
		return "board/viewer";
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/board/modify")
	public String modify(NoticeVO nvo, Model model) {
		noticeservice.update(nvo);
		return "redirect:/board/notice";
	}

	@GetMapping("/board/notice/reply")
	public String reply(ReplyVO rvo, RedirectAttributes rttr) {
		rs.insert(rvo);
		rttr.addAttribute("sequence", rvo.getN_num());
		
		return "redirect:/board/view";
	}

	@GetMapping("/forgot/forgot")
	public void fotgot() {

	}

	@GetMapping("/contact/contact")
	public void contact() {

	}

	@GetMapping("/contact/view")
	public String views(ConTactVO cvo, Model model) {
		model.addAttribute("cvo", cs.getPage(cvo));
		cs.status(cvo.getNum());
		return "contact/view";
	}

	@PostMapping("/contact/mail")
	public String mail(ConTactVO cvo) {
		cs.insert(cvo);

		return "redirect:/contact/contact";
	}

	@GetMapping("/about")
	public String about() {

		return "/inquire/about";

	}

	@GetMapping("/fare")
	public String fare() {
		return "/inquire/fare";

	}

	@GetMapping("/inquire")
	public String inquire() {

		return "/inquire/inquire";
	}

}
