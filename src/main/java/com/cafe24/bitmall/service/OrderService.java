package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.bitmall.repository.MemberOptionDao;
import com.cafe24.bitmall.repository.OrderDao;
import com.cafe24.bitmall.repository.OrderItemDao;
import com.cafe24.bitmall.vo.BankVo;
import com.cafe24.bitmall.vo.CardVo;
import com.cafe24.bitmall.vo.MemberOptionVo;
import com.cafe24.bitmall.vo.OrderItemVo;
import com.cafe24.bitmall.vo.OrderVo;

@Service
public class OrderService {

	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private OrderItemDao cartDao;
		
	@Autowired
	private MemberOptionDao memberOptionDao;
	
	@Transactional
	public long pay(String payType, BankVo bank, CardVo card) {
		if(payType.equals("bank")) {
			orderDao.insertBank(bank);
			return bank.getNo();
		}
		
		orderDao.insertCard(card);
		return card.getNo();
	}

	public void registerItem(
			OrderItemVo orderItem, 
			String type, 
			MemberOptionVo memberOption, 
			OrderVo order) {
			
			order.setStatus("배송대기");
			orderDao.insertOrder(order);
		
		if(type.equals("one")) {
			orderItem.setOrderNo(order.getNo());
			orderItem.setIsOrder(true);
			cartDao.insert(orderItem);
		} else {
			for(OrderItemVo cart : orderItem.getCartList()) {
				cart.setOrderNo(order.getNo());
				cart.setMemberNo(order.getMemberNo());
				cart.setIsOrder(true);
				cartDao.update(cart);
			}
		}
		if(memberOption.getMemberOptionList() != null) {
			for(MemberOptionVo option : memberOption.getMemberOptionList()) {
				option.setCartNo(orderItem.getNo());
				memberOptionDao.insert(option);
			}
		} //옵션 추가
	}

	public List<OrderVo> getList() {
		return orderDao.getList();
	}

	
	public OrderVo getOne(long orderNo) {
		return orderDao.getOne(orderNo);
	}

	public BankVo getBank(long bankNo) {
		return orderDao.getBank(bankNo);
	}

	public CardVo getCard(long cardNo) {
		return null;
	}

	public List<OrderVo> getListByMemberNo(long memberNo) {
		return orderDao.getListByMemberNo(memberNo);
	}

	public boolean modifyStatus(long orderNo, String status) {
		return orderDao.updateStatus(orderNo, status);
	}

	public int delete(long orderNo) {
		return orderDao.delete(orderNo);
	}
	
	

}
