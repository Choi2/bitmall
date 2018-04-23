package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.bitmall.repository.MemberOptionDao;
import com.cafe24.bitmall.repository.OrderItemDao;
import com.cafe24.bitmall.vo.ItemVo;
import com.cafe24.bitmall.vo.MemberOptionVo;
import com.cafe24.bitmall.vo.OrderItemVo;

@Service
@Transactional
public class OrderItemService {
	
	@Autowired
	private OrderItemDao orderItemDao;

	@Autowired
	private MemberOptionDao memberOptionDao;
	

	public void addItem(ItemVo vo, 
						long memberNo, 
						MemberOptionVo memberOption) {
		
		OrderItemVo orderItem = new OrderItemVo();
		
		orderItem.setItemNo(vo.getNo());
		orderItem.setMemberNo(memberNo);
		orderItem.setItemCount(vo.getItemCount());
		orderItem.setPrice(vo.getDiscountPrice() * vo.getItemCount());
		orderItemDao.insert(orderItem);
		
		if(memberOption.getMemberOptionList() != null) {
			for(MemberOptionVo option : memberOption.getMemberOptionList()) {
				option.setCartNo(orderItem.getNo());
				memberOptionDao.insert(option);
			} //옵션 추가
		}
		/*int error = 5 / 0;*/ //RuntimeException ^^
	}

	public List<OrderItemVo> getListByMemberNo(long memberNo) {
		return orderItemDao.getListByMemberNo(memberNo);
	}
	
	public List<OrderItemVo> getListByOrderNo(long orderNo) {
		return orderItemDao.getListByOrderNo(orderNo);
	}

	public List<OrderItemVo> getListByAllMember(long memberNo) {
		return orderItemDao.getListByAllMember(memberNo);
	}


}
