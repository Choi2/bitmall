package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.repository.CartDao;
import com.cafe24.bitmall.vo.CartVo;
import com.cafe24.bitmall.vo.ItemVo;

@Service
public class CartService {
	
	@Autowired
	private CartDao cartDao;

	public void addItem(ItemVo vo, long memberNo) {
		cartDao.insert(vo, memberNo);
	}

	public List<CartVo> getList(long no) {
		return cartDao.getList(no);
	}
	
}
