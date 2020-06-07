package com.rental.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.rental.domain.CustomUser;
import com.rental.mapper.MemberMapper;
import com.rental.mapper.UserLogMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private UserDetailsService service;

	@Autowired
	private MemberMapper mmapper;
	@Autowired
	private UserLogMapper mapper;

	@Autowired
	private BCryptPasswordEncoder pass;

	// 에러 메세지
	private static final String ACCOUNT_DISENABLE_ERROR = "비밀번호 실패 10회 초과되어 계정이 일시 잠금 되었습니다. <p>관리자에게 문의해주세요.</p>";
	private static final String ACCOUNT_NOT_PASSWORD_ERROR = "비밀번호가 일치하지 않습니다.<p>다시 시도해주세요.</p>";
	private static final String ACCOUNT_NOT_EMAIL_AUTH = "이메일 인증을 하시면 계정이 활성화 됩니다.";

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username = (String) authentication.getPrincipal();
		String password = (String) authentication.getCredentials();
		log.debug("AuthenticationProvider :::::: 1");

		CustomUser user = (CustomUser) service.loadUserByUsername(username);

		log.debug("AuthenticationProvider loadUserByUsername :::::: 3");
		if (!pass.matches(password, user.getPassword())) {
			log.debug("matchPassword :::::::: false!");
			mapper.UserLoginFail(user.getUsername());
			throw new BadCredentialsException(ACCOUNT_NOT_PASSWORD_ERROR);
		}
		if (mapper.UserLogInfo(user.getUsername()).getFail_count() >= 10) {
			log.debug("계정 잠금");
			mmapper.DisEnabled(user.getUsername());
			throw new LockedException(ACCOUNT_DISENABLE_ERROR);
		}

		log.debug("User Enabled : " + user.isEnabled());
		log.debug("User Enabled : " + user.isAccountNonLocked());
		

		if (!user.isEnabled()) {
			log.debug("isEnabled :::::::: false!");
			log.info("이메일 인증을 해주시길 바랍니다.");
			throw new DisabledException(ACCOUNT_NOT_EMAIL_AUTH);
		}

		log.debug("matchPassword :::::::: true!");
		mapper.FullFailCount(user.getUsername());
		log.info("성공적인 로그인");
		return new UsernamePasswordAuthenticationToken(user, user, user.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}

}
