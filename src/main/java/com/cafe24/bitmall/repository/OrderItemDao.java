package com.cafe24.bitmall.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.bitmall.vo.OrderItemVo;

@Repository

public class OrderItemDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Transactional
	public int insert(OrderItemVo vo) {
		return sqlSession.insert("order-item.insert", vo);
	}

	public List<OrderItemVo> getListByMemberNo(long memberNo) {
		return sqlSession.selectList("order-item.getListByMemberNo", memberNo);
	}
	
	public List<OrderItemVo> getListByOrderNo(long orderNo) {
		return sqlSession.selectList("order-item.getListByOrderNo", orderNo);
	}

	public int update(OrderItemVo cart) {
		return sqlSession.update("order-item.update", cart);
	}

	public List<OrderItemVo> getListByAllMember(long memberNo) {
		return sqlSession.selectList("order-item.getListByAllMember", memberNo);
	}
}
