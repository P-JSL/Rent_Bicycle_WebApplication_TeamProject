package com.rental.service;

import java.util.List;

import com.rental.domain.Criteria;
import com.rental.domain.ProductVO;

public interface ProductService {


	public List<ProductVO> getList(Criteria cri);
	public int count();
	public void insert(ProductVO pvo);
	public ProductVO getPage(int num);
	public void notmany(int num);
	public void statusminus(int num);
	public List<ProductVO> AllList();
}
