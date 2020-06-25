package com.rental.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.rental.domain.Criteria;
import com.rental.domain.PageDTO;
import com.rental.domain.ProductVO;
import com.rental.service.ChartService;
import com.rental.service.ProductService;
import com.rental.service.ReplyService;
import com.rental.service.ResTableService;
import com.rental.service.UserLogService;

import lombok.Setter;

@Controller
@RequestMapping(value = "/users/*", method = { RequestMethod.GET, RequestMethod.POST })
public class UserController {

	@Setter(onMethod_ = { @Autowired })
	private UserLogService logser;

	@Setter(onMethod_ = { @Autowired })
	private ReplyService rs;

	@Setter(onMethod_ = { @Autowired })
	private ChartService chart;

	@Setter(onMethod_ = { @Autowired })
	private ResTableService rst;

	@Setter(onMethod_ = { @Autowired })
	private ProductService ps;

	@GetMapping("/index")
	public void index(@RequestParam("userid") String userid, Model model) {
		Gson gson = new Gson();
		String DataToJson = gson.toJson(chart.Jdata(userid));
		System.out.println(DataToJson);
		model.addAttribute("count", rst.count(userid));
		model.addAttribute("JsonData", DataToJson);
		model.addAttribute("userid", userid);
		model.addAttribute("loginfo", logser.UserLogInfo(userid));
		model.addAttribute("reply", rs.UserReply(userid));
	}

	@GetMapping("/profile")
	public void profile(String userid, Model model) {
		model.addAttribute("user", logser.users(userid));
		model.addAttribute("userid", userid);

	}

	@GetMapping("/Reservation")
	public void Reservation(String userid, Model model, Criteria cri) {
		if(ps.AllList() != null) {			
			for (ProductVO pvo : ps.AllList()) {
				if (pvo.getMany() == 0 && pvo.getStatus() == 1) {
					ps.statusminus(pvo.getNum());
				}
			}
		}
		// 다중 파라미터를 mybatis로 보낼떄
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("pageNum", cri.getPageNum());
		map.put("amount", cri.getAmount());
		try {			
			model.addAttribute("count", rst.count(userid));
			model.addAttribute("res", rst.pageList(map));
			model.addAttribute("userid", userid);
			model.addAttribute("pageMaker", new PageDTO(cri, rst.count(userid).getCount()));
		}catch(NullPointerException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getClass().getMethods());
		}

	}

	@GetMapping("/Apply")
	public void Apply(Model model, String userid) {
		model.addAttribute("userid", userid);
	}
	
	@PostMapping("/Apply/{userid}")
	public String applyid(@PathVariable("userid") String userid, RedirectAttributes rttr) {
			System.out.println(userid);
			rttr.addAttribute("userid",userid);
			return "redirect:/users/index";
	}
}
