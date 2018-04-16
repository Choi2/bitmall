package com.cafe24.bitmall.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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


	public int insertCard(CardVo card) {
		return sqlSession.insert("order.insertCard", card);
	}


	public OrderVo getOne(long orderNo) {
		return sqlSession.selectOne("order.getOne", orderNo);
	}


	public BankVo getBank(long bankNo) {
		return sqlSession.selectOne("order.getBank", bankNo);
	}


	public List<OrderVo> getListByMemberNo(long memberNo) {
		return sqlSession.selectList("order.getListByMemberNo", memberNo);
	}


	public boolean updateStatus(long orderNo, String status) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("orderNo", orderNo);
		parameters.put("status", status);
		return (sqlSession.update("order.updateStatus", parameters) == 1);
	}

	public int delete(long orderNo) {
		return sqlSession.delete("order.delete", orderNo);
	}
	
}
