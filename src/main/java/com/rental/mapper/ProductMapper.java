package com.rental.mapper;

import java.util.HashMap;
import java.util.List;

import com.rental.domain.CourseVO;
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
	
	//Cart
	

	public List<ProductVO> productSearch(HashMap<String, String> map);

	public void cartinsert(ProductVO pvo);

	public List<ProductVO> cartlist(String userid);

	public void deletecart(int num);

	public void insertrescart(ProductVO pvo);

	public void insertcourse(CourseVO cvo);

	public List<CourseVO> getCList(Criteria cri);

	public int Ccount();
	
	public CourseVO getCPage(int num);
	
	public void updatecourse(CourseVO cvo);
	
	public void viewcount(int num);
	
	public void courseDelete(int num);
	
	public ProductVO searchcart(int num);
	
	public int User_Cart_count(String userid);
	//
	public List<CourseVO> getCmain();

	public List<ProductVO> getPmain();
	
}
