package com.rental.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.rental.domain.Criteria;
import com.rental.domain.Criteria_c;
import com.rental.domain.IPBanList;
import com.rental.domain.MemberVO;
import com.rental.domain.PageDTO;
import com.rental.domain.PageDTO_c;
import com.rental.domain.ProductVO;
import com.rental.service.ChartService;
import com.rental.service.ConTactService;
import com.rental.service.IPService;
import com.rental.service.NoticeService;
import com.rental.service.ProductService;
import com.rental.service.QNAService;
import com.rental.service.ReplyService;
import com.rental.service.UserLogService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/admin/*")
public class AdminController {

	@Setter(onMethod_ = { @Autowired })
	private UserLogService service;

	@Setter(onMethod_ = { @Autowired })
	private ChartService Chart;;

	@Setter(onMethod_ = { @Autowired })
	private NoticeService ns;
	@Setter(onMethod_ = { @Autowired })
	private ReplyService rs;

	@Setter(onMethod_ = { @Autowired })
	private QNAService qs;

	@Setter(onMethod_ = { @Autowired })
	private ConTactService cs;

	@Setter(onMethod_ = { @Autowired })
	private ProductService ps;

	@Setter(onMethod_ = { @Autowired })
	private IPService ips;

	Gson gson = new Gson();

	@GetMapping("/index")
	public void index(String userid, Model model, @ModelAttribute("cri") Criteria cri) {
		log.info("welcome admin dashboard");

		List<MemberVO> mvo = service.getListWithPaging(cri);

		List<IPBanList> ib = ips.find_ip_ban_list();
		for (int i = 0; i < mvo.size(); i++) { // i = 1 ~ 6
			for (int j = 0; j < ib.size(); j++) { // j = 1
				if (mvo.get(i).getUserid().equals(ib.get(j).getUserid())
						&& mvo.get(i).getIp().equals(ib.get(j).getIp())) {
					mvo.get(i).setThisip(!ib.get(j).isEnabled());
				} else {
					mvo.get(i).setThisip(ib.get(j).isEnabled());
				}
			}
		}

		String DataToJson = gson.toJson(Chart.JsonData());
		System.out.println(DataToJson);
		model.addAttribute("JsonData", DataToJson);
		model.addAttribute("userid", userid);
		model.addAttribute("reply", rs.list());
		model.addAttribute("users", service.PureAllUser());
		model.addAttribute("loginfo", service.UserLogInfo(userid));
		model.addAttribute("UserList", mvo);
		;
		model.addAttribute("pageMaker", new PageDTO(cri, service.AllUser(cri)));

	}

	@GetMapping("/profile")
	public void profile(String userid, Model model) {
		model.addAttribute("userid", userid);
		model.addAttribute("loginfo", service.UserLogInfo(userid));
		model.addAttribute("users", service.PureAllUser());
	}

	@GetMapping("/CommunityManager")
	public void Manager(Model model, String userid, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("userid", userid);
	}

	@GetMapping("/product_manager")
	public void product(String userid, Model model, @ModelAttribute("cri") Criteria cri) {
		for (ProductVO pvo : ps.AllList()) {
			if (pvo.getMany() == 0) {
				ps.statusminus(pvo.getNum());
			}
		}
		model.addAttribute("userid", userid);
		model.addAttribute("product", ps.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, ps.count()));

	}

	@GetMapping("/notice")
	public void notice(String userid, Model model, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("userid", userid);

		model.addAttribute("list", ns.List(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, ns.NoticeCount()));
	}

	@GetMapping("/QnA")
	public void Qna(String userid, Model model, @ModelAttribute("cri") Criteria cri, Criteria_c cri_c) {
		model.addAttribute("userid", userid);
		model.addAttribute("qa", qs.list(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, qs.count()));
		// Contact
		model.addAttribute("cs", cs.List(cri_c));
		model.addAttribute("pageMaker_c", new PageDTO_c(cri_c, cs.count()));
	}
}
