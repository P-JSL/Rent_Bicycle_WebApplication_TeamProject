package com.rental.controller;

import java.io.IOException;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.rental.domain.AReplyVO;
import com.rental.domain.ApplyVO;
import com.rental.domain.CourseVO;
import com.rental.domain.IPBanList;
import com.rental.domain.MemberVO;
import com.rental.domain.NoticeVO;
import com.rental.domain.ProductVO;
import com.rental.domain.QnAVO;
import com.rental.domain.ReplyVO;
import com.rental.domain.ResTableVO;
import com.rental.domain.ReviewVO;
import com.rental.service.AReplyServiceImpl;
import com.rental.service.ApplyService;
import com.rental.service.IPService;
import com.rental.service.MemberService;
import com.rental.service.NoticeService;
import com.rental.service.ProductService;
import com.rental.service.QNAService;
import com.rental.service.ReplyService;
import com.rental.service.ResTableService;
import com.rental.service.ReviewService;
import com.rental.service.UserNoticeService;
import com.rental.util.Utility;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@PreAuthorize("permitAll")

public class MainController {

	@Setter(onMethod_ = { @Autowired })
	private MemberService service;
	@Setter(onMethod_ = { @Autowired })
	private NoticeService noticeservice;
	@Setter(onMethod_ = { @Autowired })
	private ProductService ps;
	@Setter(onMethod_ = { @Autowired })
	private ReplyService rs;
	@Setter(onMethod_ = { @Autowired })
	private QNAService qs;
	@Setter(onMethod_ = { @Autowired })
	private ApplyService as;
	@Setter(onMethod_ = { @Autowired })
	private IPService ipservice;
	@Setter(onMethod_ = { @Autowired })
	private ResTableService rst;
	@Setter(onMethod_ = { @Autowired })
	private UserNoticeService uns;
	@Setter(onMethod_ = { @Autowired })
	private ReviewService rservice;

	@GetMapping("/")
	public String index(Model model) {
		List<CourseVO> cvo = ps.getmain();
		List<ProductVO> pvo = ps.getPmain();
		List<ReviewVO> rvo = rservice.getRmain();
		model.addAttribute("clist", cvo);
		model.addAttribute("plist", pvo);
		model.addAttribute("rlist", rvo);
		return "index";
	}

	@GetMapping("/{userid}")
	public String indexid(Model model, @PathVariable("userid") String userid, HttpSession session) {
		List<CourseVO> cvo = ps.getmain();
		List<ProductVO> pvo = ps.getPmain();
		List<ReviewVO> rvo = rservice.getRmain();
		model.addAttribute("clist", cvo);
		model.addAttribute("plist", pvo);
		model.addAttribute("rlist", rvo);
		model.addAttribute("cart-count", ps.User_Cart_count(userid));
		return "index";
	}

	@GetMapping("/emailauth")
	public String UserEnable(MemberVO mvo) {
		log.info(service.AccountEnabled(mvo));
		return "/login";
	}

	@ResponseBody
	@PostMapping(value = "/emailcheck", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Boolean> EmailCheck(@RequestBody String useremail, HttpServletResponse res,
			HttpServletRequest req) throws JsonParseException, JsonMappingException, IOException {

		JsonParser parser = new JsonParser();
		JsonElement robj = parser.parse(useremail).getAsJsonObject().get("useremail");

		log.warn("이메일 !! : " + useremail);
		String email = robj.getAsString();

		boolean on = service.EmailCheck(email) == null ? true : false;

		return new ResponseEntity<>(on, HttpStatus.OK);
	}

	@ResponseBody
	@PostMapping(value = "/idcheck", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Boolean> idCheck(@RequestBody String userid, HttpServletResponse res, HttpServletRequest req)
			throws JsonParseException, JsonMappingException, IOException {

		JsonParser parser = new JsonParser();
		JsonElement robj = parser.parse(userid).getAsJsonObject().get("userid");

		log.warn("아이디 !! : " + userid);
		String id = robj.getAsString();

		boolean on = service.IdCheck(id) == null ? true : false;

		return new ResponseEntity<>(on, HttpStatus.OK);
	}

	@ResponseBody
	@PostMapping(value = "/id_delete", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Boolean> id_delete(@RequestBody String userid, HttpServletResponse res,
			HttpServletRequest req) throws JsonParseException, JsonMappingException, IOException {

		JsonParser parser = new JsonParser();
		JsonElement robj = parser.parse(userid).getAsJsonObject().get("userid");

		log.warn("아이디 !! : " + userid);
		String id = robj.getAsString();

		boolean on = service.Delete_id(id) == 1 ? true : false;

		return new ResponseEntity<>(on, HttpStatus.OK);
	}

	@ResponseBody
	@PostMapping(value = "/revitailze", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Boolean> revitailze(@RequestBody String JsonData, HttpServletResponse res,
			HttpServletRequest req) throws JsonParseException, JsonMappingException, IOException {

		JsonParser parser = new JsonParser();
		log.warn(JsonData);
		String userid = parser.parse(JsonData).getAsJsonObject().get("userid").getAsString();
		boolean enabled = parser.parse(JsonData).getAsJsonObject().get("enabled").getAsBoolean();

		MemberVO mvo = new MemberVO();
		mvo.setEnabled(enabled);
		mvo.setUserid(userid);

		log.warn("사용 변경 !! : " + enabled);
		log.warn("아이디 !! : " + userid);

		boolean ok = service.revitailze(mvo) == 1 ? true : false;
		System.out.println("ok ? : " + ok);
		return new ResponseEntity<>(ok, HttpStatus.OK);
	}

	@ResponseBody
	@PostMapping(value = "/delete", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Boolean> delete(@RequestBody String JsonData, HttpServletResponse res, HttpServletRequest req)
			throws JsonParseException, JsonMappingException, IOException {

		JsonParser parser = new JsonParser();
		log.warn(JsonData);
		String userid = parser.parse(JsonData).getAsJsonObject().get("userid").getAsString();
		int sequence = parser.parse(JsonData).getAsJsonObject().get("sequence").getAsInt();

		NoticeVO mvo = new NoticeVO();
		mvo.setSequence(sequence);
		mvo.setUserid(userid);

		log.warn("번호 !! : " + sequence);
		log.warn("아이디 !! : " + userid);

		boolean ok = noticeservice.delete(mvo) == 1 ? true : false;
		System.out.println("ok ? : " + ok);
		return new ResponseEntity<>(ok, HttpStatus.OK);
	}

	@ResponseBody
	@PostMapping(value = "/recommend", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<NoticeVO> recommend(@RequestBody String recommend, HttpServletResponse res,
			HttpServletRequest req) throws JsonParseException, JsonMappingException, IOException {

		JsonParser parser = new JsonParser();
		log.warn(recommend);
		boolean recommends = parser.parse(recommend).getAsJsonObject().get("recommend").getAsBoolean();
		int sequence = parser.parse(recommend).getAsJsonObject().get("sequence").getAsInt();
		int re = recommends == true ? 1 : 0;

		NoticeVO nvo = new NoticeVO();
		nvo.setSequence(sequence);
		nvo.setRecommend(re);

		noticeservice.recommend(nvo.getSequence());

		return new ResponseEntity<>(noticeservice.viewer(nvo.getSequence()), HttpStatus.OK);

	}

	@ResponseBody
	@PostMapping(value = "/disrecommend", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<NoticeVO> disrecommend(@RequestBody String recommend, HttpServletResponse res,
			HttpServletRequest req) throws JsonParseException, JsonMappingException, IOException {

		JsonParser parser = new JsonParser();
		log.warn(recommend);
		boolean recommends = parser.parse(recommend).getAsJsonObject().get("disrecommend").getAsBoolean();
		log.debug("log recomm : " + recommends);
		int sequence = parser.parse(recommend).getAsJsonObject().get("sequence").getAsInt();
		log.debug("log seq : " + sequence);
		int re = recommends == true ? 1 : 0;

		NoticeVO nvo = new NoticeVO();
		nvo.setSequence(sequence);
		nvo.setRecommend(re);
		log.info(nvo);
		noticeservice.disrecommend(nvo.getSequence());

		return new ResponseEntity<>(noticeservice.viewer(nvo.getSequence()), HttpStatus.OK);

	}

	@ResponseBody
	@PostMapping(value = "/board/thup", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Object> userrecom(@RequestBody String recommend, HttpServletResponse res,
			HttpServletRequest req) throws JsonParseException, JsonMappingException, IOException {

		JsonParser parser = new JsonParser();
		log.warn(recommend);
		boolean recommends = parser.parse(recommend).getAsJsonObject().get("recommend").getAsBoolean();
		int sequence = parser.parse(recommend).getAsJsonObject().get("sequence").getAsInt();
		uns.recommend(sequence);

		return new ResponseEntity<>(uns.viewer(sequence).getRecommend(), HttpStatus.OK);

	}

	@ResponseBody
	@PostMapping(value = "/board/down", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Object> userdisrecom(@RequestBody String recommend, HttpServletResponse res,
			HttpServletRequest req) throws JsonParseException, JsonMappingException, IOException {

		JsonParser parser = new JsonParser();
		log.warn(recommend);
		boolean recommends = parser.parse(recommend).getAsJsonObject().get("disrecommend").getAsBoolean();
		log.debug("log recomm : " + recommends);
		int sequence = parser.parse(recommend).getAsJsonObject().get("sequence").getAsInt();
		log.debug("log seq : " + sequence);
		uns.disrecommend(sequence);
		return new ResponseEntity<>(uns.viewer(sequence).getDisrecommend(), HttpStatus.OK);

	}

	@ResponseBody
	@PostMapping(value = "/forgot/reset", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<String> Reset(@RequestBody String recommend, HttpServletResponse res, HttpServletRequest req)
			throws JsonParseException, JsonMappingException, IOException {

		JsonParser parser = new JsonParser();

		String userid = parser.parse(recommend).getAsJsonObject().get("userid").getAsString().toString();
		String userpw = parser.parse(recommend).getAsJsonObject().get("userpw").getAsString().toString();

		MemberVO mvo = new MemberVO();
		mvo.setUserid(userid);
		mvo.setUserpw(userpw);
		String password = service.Reset(mvo);
		System.out.println(userpw);
		mvo.setUserpw(password);
		return new ResponseEntity<>(userpw, HttpStatus.OK);

	}

	@ResponseBody
	@PostMapping(value = "/forgot/findId", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<String> FindId(@RequestBody String recommend, HttpServletResponse res, HttpServletRequest req)
			throws JsonParseException, JsonMappingException, IOException {

		JsonParser parser = new JsonParser();

		String useremail = parser.parse(recommend).getAsJsonObject().get("useremail").getAsString().toString();

		MemberVO mvo = new MemberVO();
		mvo.setUseremail(useremail);
		mvo = service.FindId(mvo);
		return new ResponseEntity<>(mvo.getUserid(), HttpStatus.OK);

	}

	@ResponseBody
	@PostMapping(value = "/likes", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Object> likes(@RequestBody String recommend, HttpServletResponse res, HttpServletRequest req)
			throws JsonParseException, JsonMappingException, IOException {

		JsonParser parser = new JsonParser();

		String userid = parser.parse(recommend).getAsJsonObject().get("userid").getAsString().toString();
		int num = parser.parse(recommend).getAsJsonObject().get("num").getAsInt();
		int n_num = parser.parse(recommend).getAsJsonObject().get("n_num").getAsInt();

		ReplyVO rvo = new ReplyVO();
		rvo.setN_num(n_num);
		rvo.setNum(num);
		rvo.setUserid(userid);
		boolean ok = rs.likes(rvo) == 1 ? true : false;
		return new ResponseEntity<>(rs.Yreply(rvo), HttpStatus.OK);

	}

	@ResponseBody
	@PostMapping(value = "/hates", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Object> hates(@RequestBody String recommend, HttpServletResponse res, HttpServletRequest req)
			throws JsonParseException, JsonMappingException, IOException {

		JsonParser parser = new JsonParser();

		String userid = parser.parse(recommend).getAsJsonObject().get("userid").getAsString().toString();
		int num = parser.parse(recommend).getAsJsonObject().get("num").getAsInt();
		int n_num = parser.parse(recommend).getAsJsonObject().get("n_num").getAsInt();

		ReplyVO rvo = new ReplyVO();
		rvo.setN_num(n_num);
		rvo.setNum(num);
		rvo.setUserid(userid);
		boolean ok = rs.hates(rvo) == 1 ? true : false;

		return new ResponseEntity<>(rs.Yreply(rvo), HttpStatus.OK);

	}

	@ResponseBody
	@PostMapping(value = "/QnA/delete", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Boolean> QnAdelete(@RequestBody String JsonData, HttpServletResponse res,
			HttpServletRequest req) throws JsonParseException, JsonMappingException, IOException {

		JsonParser parser = new JsonParser();
		log.warn(JsonData);
		String userid = parser.parse(JsonData).getAsJsonObject().get("userid").getAsString();
		int sequence = parser.parse(JsonData).getAsJsonObject().get("sequence").getAsInt();

		QnAVO qvo = new QnAVO();

		qvo.setNum(sequence);
		qvo.setWriter(userid);
		log.warn("번호 !! : " + sequence);
		log.warn("아이디 !! : " + userid);

		boolean ok = qs.delete(qvo) == 1 ? true : false;
		System.out.println("ok ? : " + ok);
		return new ResponseEntity<>(ok, HttpStatus.OK);
	}

	@ResponseBody
	@PostMapping(value = "/reply/delete", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Boolean> replyDelete(@RequestBody String JsonData, HttpServletResponse res,
			HttpServletRequest req) throws JsonParseException, JsonMappingException, IOException {

		JsonParser parser = new JsonParser();
		log.warn(JsonData);
		String userid = parser.parse(JsonData).getAsJsonObject().get("userid").getAsString();
		int sequence = parser.parse(JsonData).getAsJsonObject().get("n_num").getAsInt();

		ReplyVO rvo = new ReplyVO();
		rvo.setNum(sequence);
		rvo.setUserid(userid);
		log.warn("번호 !! : " + sequence);
		log.warn("아이디 !! : " + userid);

		boolean ok = rs.ReplyDelete(rvo) == 1 ? true : false;
		System.out.println("ok ? : " + ok);
		return new ResponseEntity<>(ok, HttpStatus.OK);
	}

	@ResponseBody
	@PostMapping(value = "/confirm", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Boolean> ApplyConfirm(@RequestBody String JsonData, HttpServletResponse res,
			HttpServletRequest req) throws JsonParseException, JsonMappingException, IOException {

		JsonParser parser = new JsonParser();
		log.warn(JsonData);
		String userid = parser.parse(JsonData).getAsJsonObject().get("userid").getAsString();

		ApplyVO avo = new ApplyVO();
		avo.setUserid(userid);

		log.warn("아이디 !! : " + userid);

		boolean ok = as.configm(avo) == 1 ? true : false;
		System.out.println("ok ? : " + ok);
		return new ResponseEntity<>(ok, HttpStatus.OK);
	}

	@ResponseBody
	@PostMapping(value = "/ip", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Boolean> ip(@RequestBody String JsonData, HttpServletResponse res, HttpServletRequest req)
			throws JsonParseException, JsonMappingException, IOException {

		JsonParser parser = new JsonParser();
		log.warn(JsonData);
		String userid = parser.parse(JsonData).getAsJsonObject().get("userid").getAsString();
		String ip = parser.parse(JsonData).getAsJsonObject().get("ip").getAsString();
		boolean ban = parser.parse(JsonData).getAsJsonObject().get("ban").getAsBoolean();

		IPBanList iplist = new IPBanList();

		iplist.setIp(ip);
		iplist.setUserid(userid);
		log.warn("아이디 !! : " + userid);
		log.warn("IP !! : " + ip);
		log.warn("ban 여부 : " + ban);
		boolean ok = false;
		if (!ban) {
			ok = ipservice.ipinsert(iplist) == 1 ? true : false;
		} else {
			ok = ipservice.ipdelete(iplist) == 1 ? false : true;
		}
		log.warn("OK boolean : " + ok);
		return new ResponseEntity<>(ok, HttpStatus.OK);
	}

	@ResponseBody
	@PostMapping(value = "/res_conf", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Boolean> res_conf(@RequestBody String JsonData, HttpServletResponse res,
			HttpServletRequest req) throws JsonParseException, JsonMappingException, IOException {

		JsonParser parser = new JsonParser();
		log.warn(JsonData);
		String userid = parser.parse(JsonData).getAsJsonObject().get("userid").getAsString();

		ApplyVO avo = new ApplyVO();
		avo.setUserid(userid);

		log.warn("아이디 !! : " + userid);

		boolean ok = rst.count(userid) != null ? true : false;
		System.out.println("ok ? : " + ok);
		return new ResponseEntity<>(ok, HttpStatus.OK);
	}

	@ResponseBody
	@PostMapping(value = "/cart_counter", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Object> cart_counter(@RequestBody String JsonData, HttpServletResponse res,
			HttpServletRequest req) throws JsonParseException, JsonMappingException, IOException {

		JsonParser parser = new JsonParser();
		log.warn(JsonData);
		String userid = "";
		if (JsonData != null) {
			userid = parser.parse(JsonData).getAsJsonObject().get("userid").getAsString();
			return new ResponseEntity<>(ps.User_Cart_count(userid), HttpStatus.OK);
		} else {
			return new ResponseEntity<>(0, HttpStatus.OK);
		}

	}

	@ResponseBody
	@PostMapping(value = "/cart_insert", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Object> cart_insert(@RequestBody String JsonData, HttpServletResponse res,
			HttpServletRequest req) throws JsonParseException, JsonMappingException, IOException {

		// 객체 생성
		List<ResTableVO> rv = new ArrayList<ResTableVO>();
		ResTableVO rvo = null;
		JsonParser parser = new JsonParser();
		log.warn(JsonData);
		JsonArray num = parser.parse(JsonData).getAsJsonObject().get("num").getAsJsonArray();
		JsonArray userid = parser.parse(JsonData).getAsJsonObject().get("userid").getAsJsonArray();
		JsonArray nickname = parser.parse(JsonData).getAsJsonObject().get("nickname").getAsJsonArray();
		JsonArray price = parser.parse(JsonData).getAsJsonObject().get("price").getAsJsonArray();
		JsonArray goodsphoto = parser.parse(JsonData).getAsJsonObject().get("goodsphoto").getAsJsonArray();
		JsonArray goods = parser.parse(JsonData).getAsJsonObject().get("goods").getAsJsonArray();
		JsonArray startdate = parser.parse(JsonData).getAsJsonObject().get("startdate").getAsJsonArray();
		JsonArray lastdate = parser.parse(JsonData).getAsJsonObject().get("lastdate").getAsJsonArray();

		int size = nickname.size();
		log.info("번호  : " + num);
		log.info("아이디  :  " + userid);
		log.info("가격  :  " + price);
		log.info("상품 이미지   " + goodsphoto);
		log.info("닉네임  " + nickname);
		log.info("상품 " + goods);

		for (int i = 0; i < size; i++) {
			rvo = new ResTableVO();
			rvo.setN_num(num.get(i).getAsInt());
			rvo.setUserid(userid.get(i).getAsString());
			rvo.setPrice(price.get(i).getAsInt());
			rvo.setGoodsphoto(goodsphoto.get(i).getAsString());
			rvo.setNickname(nickname.get(i).getAsString());
			rvo.setGoods(goods.get(i).getAsString());
			rvo.setStartdate(startdate.get(i).getAsString());
			rvo.setLastdate(lastdate.get(i).getAsString());
			rv.add(rvo);
		}
		log.warn("List :" + rv);
		for (int i = 0; i < rv.size(); i++) {
			rvo = rv.get(i);
			rst.insert(rvo);
		}
		boolean confirm = rst.AllDelete(userid.get(0).getAsString()) == 1 ? true : false;
		return new ResponseEntity<>(confirm, HttpStatus.OK);
	}

	@Setter(onMethod_ = { @Autowired })
	private AReplyServiceImpl ar;

	//
	@ResponseBody
	@PostMapping(value = "/board/reply", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<HashMap<String, String>> boardreply(@RequestBody String JsonData, HttpServletResponse res,
			HttpServletRequest req) throws JsonParseException, JsonMappingException, IOException {

		JsonParser parser = new JsonParser();
		log.warn(JsonData);
		String comm = parser.parse(JsonData).getAsJsonObject().get("comm").getAsString(); // 댓글
		String nickname = parser.parse(JsonData).getAsJsonObject().get("nickname").getAsString(); // 댓글
		int n_num = parser.parse(JsonData).getAsJsonObject().get("sequence").getAsInt();
		String pw = parser.parse(JsonData).getAsJsonObject().get("pw").getAsString();

		AReplyVO re = new AReplyVO();
		re.setUserid(pw);
		re.setComm(comm);
		re.setNickname(nickname);
		re.setN_num(n_num);
		ar.insert(re);
		String ReplyHTMLDiv = Utility.ReplyHTML(comm, nickname, n_num, pw);
		// Reply.add(ReplyHTMLDiv);

		HashMap<String, String> rep = new HashMap<String, String>();
		rep.put("html", ReplyHTMLDiv);

		return new ResponseEntity<>(rep, HttpStatus.OK);

	}

	@ResponseBody
	@PostMapping(value = "/board/list/reply", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<HashMap<String, Object>> boardreplylist(@RequestBody String JsonData, HttpServletResponse res,
			HttpServletRequest req) throws JsonParseException, JsonMappingException, IOException {

		JsonParser parser = new JsonParser();
		log.warn(JsonData);
		int num = parser.parse(JsonData).getAsJsonObject().get("sequence").getAsInt();
		System.out.println(num);

		// 불러오기
		List<AReplyVO> re = ar.list(num);
		List<String> HTML = Utility.ReplyHTML(re);

		HashMap<String, Object> map = new HashMap<>();
		map.put("List", HTML);
		return new ResponseEntity<>(map, HttpStatus.OK);

	}

	@ResponseBody
	@PostMapping(value = "/board/reply/delete", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Boolean> boardreplydelete(@RequestBody String JsonData, HttpServletResponse res,
			HttpServletRequest req) throws JsonParseException, JsonMappingException, IOException {

		JsonParser parser = new JsonParser();
		log.warn(JsonData);
		int num = parser.parse(JsonData).getAsJsonObject().get("n_num").getAsInt();
		String nickname = parser.parse(JsonData).getAsJsonObject().get("nickname").getAsString();

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("nickname", nickname);
		map.put("num", num);
		boolean ok = ar.delete(map) == 1 ? true : false;

		return new ResponseEntity<>(ok, HttpStatus.OK);

	}

	@ResponseBody
	@PostMapping(value = "/notice/reply/insert", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<HashMap<String, Object>> notice_insert_reply(@RequestBody String JsonData,
			HttpServletResponse res, HttpServletRequest req)
			throws JsonParseException, JsonMappingException, IOException {

		JsonParser parser = new JsonParser();
		log.warn(JsonData);
		int n_num = parser.parse(JsonData).getAsJsonObject().get("n_num").getAsInt();
		String nickname = parser.parse(JsonData).getAsJsonObject().get("nickname").getAsString();
		String userid = parser.parse(JsonData).getAsJsonObject().get("userid").getAsString();
		String comm = parser.parse(JsonData).getAsJsonObject().get("comm").getAsString();

		ReplyVO rvo = new ReplyVO();
		rvo.setComm(comm);
		rvo.setN_num(n_num);
		rvo.setNickname(nickname);
		rvo.setUserid(userid);

		rs.insert(rvo);

		rvo = rs.OneUser(rvo);
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		String times = sdf.format(rvo.getRegdate());
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", rvo.getUserid());
		map.put("num", rvo.getNum());
		map.put("nickname", rvo.getNickname());
		map.put("comm", rvo.getComm());
		map.put("date", times);
		map.put("like", rvo.getLikes());
		map.put("hate", rvo.getHates());
		return new ResponseEntity<>(map, HttpStatus.OK);

	}
}
