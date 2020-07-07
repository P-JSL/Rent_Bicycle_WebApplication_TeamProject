package com.rental.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.rental.domain.AReplyVO;

public class Utility {
	public static String ip(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-Real-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-RealIP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
	
	public static String ReplyHTML (String comm, String nickname, int n_num // ReplyVO 대기
			) {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf =  new SimpleDateFormat("yyyy/MM/dd");
		String times = sdf.format(cal.getTime());
		String HTML = "";
		HTML +="<li class='media'><a href='#' class='pull-left'>" ;
		HTML +="<img src='https://bootdey.com/img/Content/user_1.jpg' class='img-circle'></a>";
		HTML +="<div class='media-body'><span class='text-muted pull-right'> <small class='text-muted'>"+times+"</small>";
		HTML += "<br><span class='text-muted pull-right'><button class='btn btn-outline-dangerous' onclick='deleted(this)' data-nnum='"+n_num+"' data-name='"+nickname+"'>삭제</button></span></span> <strong class='text-success'>@"+nickname+"</strong>";
		HTML +="<p>"+comm;
		HTML +="</p></div></li>";
		return HTML;
	}

	public static List<String> ReplyHTML(List<AReplyVO> re) {
		SimpleDateFormat sdf =  new SimpleDateFormat("yyyy/MM/dd");
		List<String> html =  new ArrayList<String>();
		for(int i=0; i< re.size(); i++) {			
			String times = sdf.format(re.get(i).getRegdate());
			String HTML = "";
			HTML +="<li class='media'><a href='#' class='pull-left'>" ;
			HTML +="<img src='https://bootdey.com/img/Content/user_1.jpg' class='img-circle'></a>";
			HTML +="<div class='media-body'><span class='text-muted pull-right'> <small class='text-muted'>"+times+"</small><br>";
			HTML += "<span class='text-muted pull-right'><button class='btn btn-outline-dangerous' onclick='deleted(this)' data-name='"+re.get(i).getNickname()+"' data-nnum='"+re.get(i).getNum()+"'>삭제</button></span></span> <strong class='text-success'>@"+re.get(i).getNickname()+"</strong>";
			HTML +="<p>"+re.get(i).getComm();
			HTML +="</p></div></li>";
		html.add(HTML);
		}
		
		return html;
	}

	
	
}
