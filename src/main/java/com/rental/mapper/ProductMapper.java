package com.rental.mapper;

import java.util.List;

import com.rental.domain.Criteria;
import com.rental.domain.ProductVO;

public interface ProductMapper {

	public List<ProductVO> getListWithPaging(Criteria cri);
	
	public int count();
	
	public void insert(ProductVO pvo);

	public ProductVO getPage(int num);
	
	public void notmany(int num);
	
	public void statusminus(int num);
	
	public List<ProductVO> AllList();
	
}
