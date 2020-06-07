package com.rental.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.rental.domain.Criteria;
import com.rental.domain.ProductVO;
import com.rental.mapper.ProductMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {

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

}
