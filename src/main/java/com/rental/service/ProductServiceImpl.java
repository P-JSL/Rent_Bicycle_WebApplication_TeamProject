package com.rental.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.domain.CourseVO;
import com.rental.domain.Criteria;
import com.rental.domain.ProductVO;
import com.rental.mapper.ProductMapper;

import lombok.Setter;

@Service
public class ProductServiceImpl implements ProductService {
	@Setter(onMethod_ = {@Autowired})
	private ProductMapper mapper;

	@Override
	public List<ProductVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(cri);
	}
	@Override
	public int count() {
		// TODO Auto-generated method stub
		return mapper.count();
	}
	@Override
	public void insert(ProductVO pvo) {
		// TODO Auto-generated method stub
		mapper.insert(pvo);
	}
	@Override
	public ProductVO getPage(int num) {
		// TODO Auto-generated method stub
		return mapper.getPage(num);
	}
	@Override
	public void notmany(int num) {
		// TODO Auto-generated method stub
		mapper.notmany(num);
	}
	@Override
	public void statusminus(int num) {
		// TODO Auto-generated method stub
		mapper.statusminus(num);
	}
	@Override
	public List<ProductVO> AllList() {
		// TODO Auto-generated method stub
		return mapper.AllList();
	}
 //Cart
	
	@Override
	public List<ProductVO> productSearch(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return mapper.productSearch(map);
	}
	
	@Override
	public void insertCart(ProductVO pvo) {
		mapper.cartinsert(pvo);
	}
	
	@Override
	public List<ProductVO> cartlist(String userid) {
		return mapper.cartlist(userid);
	}
	
	@Override
	public void deletecart(int num) {
		mapper.deletecart(num);
	}
	
	@Override
	public void insertrescart(ProductVO pvo) {
		mapper.insertrescart(pvo);
	}
	
	@Override
	public void insertcourse(CourseVO cvo) {
		mapper.insertcourse(cvo);
	}
	
	@Override
	public List<CourseVO> getCList(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getCList(cri);
	}
	@Override
	public int Ccount() {
		// TODO Auto-generated method stub
		return mapper.Ccount();
	}
	
	@Override
	public CourseVO getCPage(int num) {
		// TODO Auto-generated method stub
		return mapper.getCPage(num);
	}
	
	@Override
	public void updatecourse(CourseVO cvo) {
		// TODO Auto-generated method stub
		mapper.updatecourse(cvo);
	}
	
	@Override
	public void viewcount(int num) {
		// TODO Auto-generated method stub
		mapper.viewcount(num);
	}
	
	@Override
	public void courseDelete (int num) {
		// TODO Auto-generated method stub
		mapper.courseDelete(num);
	}
	
	@Override
	public ProductVO searchcart(int num) {
		// TODO Auto-generated method stub
		return mapper.searchcart(num);
	}
	//
	@Override
	public int User_Cart_count(String userid) {
		// TODO Auto-generated method stub
		return mapper.User_Cart_count(userid);
	}
	@Override
	public List<CourseVO> getmain(){
		return mapper.getCmain();
	}

	@Override
	public List<ProductVO> getPmain(){
		return mapper.getPmain();
	}

}
