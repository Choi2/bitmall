package com.cafe24.bitmall.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.BankVo;
import com.cafe24.bitmall.vo.CardVo;
import com.cafe24.bitmall.vo.OrderVo;

@Repository
public class OrderDao {
	
	@Autowired
	private SqlSession sqlSession;

	public int insertBank(BankVo bank) {
		return sqlSession.insert("order.insertBank", bank);
	}


	public int insertOrder(OrderVo order) {
		return sqlSession.insert("order.insertOrder", order);
	}


	public List<OrderVo> getList() {
		return sqlSession.selectList("order.getList");
	}


	public void insertCard(CardVo card) {
		
	}


	public OrderVo getOne(long orderNo) {
		return sqlSession.selectOne("order.getOne", orderNo);
	}


	public BankVo getBank(long bankNo) {
		return sqlSession.selectOne("order.getBank", bankNo);
	}
	
}
