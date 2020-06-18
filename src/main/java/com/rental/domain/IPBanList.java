package com.rental.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class IPBanList {
	private String userid;
	private String ip;
	private Date bandate;
	private boolean enabled;
}
