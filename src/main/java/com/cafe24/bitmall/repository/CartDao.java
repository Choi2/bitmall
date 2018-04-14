package com.cafe24.bitmall.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.bitmall.vo.CartVo;

@Repository

public class CartDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Transactional
	public int insert(CartVo vo) {
		return sqlSession.insert("cart.insert", vo);
	}

	public List<CartVo> getListByMemberNo(long memberNo) {
		return sqlSession.selectList("cart.getListByMemberNo", memberNo);
	}
	
	public List<CartVo> getListByOrderNo(long orderNo) {
		return sqlSession.selectList("cart.getListByOrderNo", orderNo);
	}
}
