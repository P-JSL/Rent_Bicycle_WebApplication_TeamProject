package com.rental.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.rental.domain.MemberVO;
import com.rental.domain.NoticeVO;
import com.rental.domain.QnAVO;
import com.rental.domain.ReplyVO;
import com.rental.service.MemberService;
import com.rental.service.NoticeService;
import com.rental.service.QNAService;
import com.rental.service.ReplyService;

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

	@GetMapping("/")
	public String index() {

		return "index";
	}

	@GetMapping("/emailauth")
	public String UserEnable(MemberVO mvo) {
		log.info(service.AccountEnabled(mvo));
		return "/All/CustomLogin";
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
		String userid = parser.parse(recommend).getAsJsonObject().get("userid").getAsString();
		int re = recommends == true ? 1 : 0;

		NoticeVO nvo = new NoticeVO();
		nvo.setSequence(sequence);
		nvo.setRecommend(re);
		nvo.setUserid(userid);

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
		String userid = parser.parse(recommend).getAsJsonObject().get("userid").getAsString();
		int re = recommends == true ? 1 : 0;

		NoticeVO nvo = new NoticeVO();
		nvo.setSequence(sequence);
		nvo.setRecommend(re);
		nvo.setUserid(userid);
		log.info(nvo);
		noticeservice.disrecommend(nvo.getSequence());

		return new ResponseEntity<>(noticeservice.viewer(nvo.getSequence()), HttpStatus.OK);

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

	@Setter(onMethod_ = { @Autowired })
	private ReplyService rs;

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

	@Setter(onMethod_ = { @Autowired })
	private QNAService qs;

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

}
