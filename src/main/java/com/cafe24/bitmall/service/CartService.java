package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.bitmall.repository.CartDao;
import com.cafe24.bitmall.repository.MemberOptionDao;
import com.cafe24.bitmall.vo.CartVo;
import com.cafe24.bitmall.vo.ItemVo;
import com.cafe24.bitmall.vo.MemberOptionVo;

@Service
@Transactional
public class CartService {
	
	@Autowired
	private CartDao cartDao;

	@Autowired
	private MemberOptionDao memberOptionDao;
	
	public void addItem(ItemVo vo, long memberNo, MemberOptionVo memberOption) {
		
		System.out.println(memberOption);
		
		CartVo cart = new CartVo();
		cart.setItemNo(vo.getNo());
		cart.setMemberNo(memberNo);
		cart.setItemCount(vo.getItemCount());
		cart.setPrice(vo.getDiscountPrice() * vo.getItemCount());
		cartDao.insert(cart);
		
		if(memberOption.getMemberOptionList() != null) {
			for(MemberOptionVo option : memberOption.getMemberOptionList()) {
				option.setCartNo(cart.getNo());
				memberOptionDao.insert(option);
			}
		}
	}

	public List<CartVo> getList(long no) {
		return cartDao.getList(no);
	}
	
}
