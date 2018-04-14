package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.bitmall.repository.CartDao;
import com.cafe24.bitmall.repository.ItemDao;
import com.cafe24.bitmall.repository.MemberOptionDao;
import com.cafe24.bitmall.repository.OrderDao;
import com.cafe24.bitmall.vo.BankVo;
import com.cafe24.bitmall.vo.CardVo;
import com.cafe24.bitmall.vo.CartVo;
import com.cafe24.bitmall.vo.MemberOptionVo;
import com.cafe24.bitmall.vo.OrderVo;

@Service
public class OrderService {

	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private CartDao cartDao;
		
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

	public void registerItem(CartVo cartVo, 
			MemberOptionVo memberOption, OrderVo order) {
		
		order.setStatus("배송대기");
		orderDao.insertOrder(order);
		cartVo.setOrderNo(order.getNo());
		cartDao.insert(cartVo);
		
		if(memberOption.getMemberOptionList() != null) {
			for(MemberOptionVo option : memberOption.getMemberOptionList()) {
				option.setCartNo(cartVo.getNo());
				memberOptionDao.insert(option);
			}
		}
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
		// TODO Auto-generated method stub
		return null;
	}

}
