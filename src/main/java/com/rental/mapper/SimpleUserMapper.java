package com.rental.mapper;

import java.util.Map;

public interface SimpleUserMapper {

	//Role 권한 갖고오기
	public String getRoleByUserName(String username);

	//전체 정보
	public Map<String, String> getAuthInfoByProviderAndUniqueId(String provider, String uniqueId);
}
