package com.rental.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ResTableVO {
	private int num, n_num;
	private String userid, goods;
	private String nickname;
	private int status;
	private String resdate, goodsphoto;
	private int price, count;

}
