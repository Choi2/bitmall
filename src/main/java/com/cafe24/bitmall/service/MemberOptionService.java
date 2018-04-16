package com.cafe24.bitmall.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.bitmall.repository.MemberOptionDao;
import com.cafe24.bitmall.vo.OrderItemVo;
import com.cafe24.bitmall.vo.MemberOptionVo;

@Service
@Transactional
public class MemberOptionService {

	@Autowired
	private MemberOptionDao memberOptionDao;

	public List<MemberOptionVo> get(List<OrderItemVo> cartList) {
		System.out.println("MemberOptionService = " + cartList);
		List<MemberOptionVo> list = new ArrayList<>();
		
		for(OrderItemVo cart : cartList) {
			List<MemberOptionVo> memberOption = memberOptionDao.getByCartNo(cart.getNo());
			for(MemberOptionVo memberOptionVo : memberOption) {
				list.add(memberOptionVo);
			}
		}

		return list;
	}

	public List<List<MemberOptionVo>> makeResult(
			List<OrderItemVo> cartList, 
			List<MemberOptionVo> options) {
		
		System.out.println("option = " + options);
		
		List<List<MemberOptionVo>> results = new ArrayList<>();
		
		for(OrderItemVo cart : cartList) {
			long key = cart.getNo();
			List<MemberOptionVo> values = new ArrayList<>();
			for(MemberOptionVo memberOption : options) {
				if(memberOption.getCartNo() == key) {
					values.add(memberOption);
				}
			}
			results.add(values);
		}
		
		return results;
	} 
}
