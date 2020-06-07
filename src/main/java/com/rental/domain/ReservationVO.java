package com.rental.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReservationVO {

	private int num;
	private String userid, seller;
	private Date buydate;
	private int status;
}
