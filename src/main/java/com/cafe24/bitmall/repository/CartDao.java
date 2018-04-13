package com.cafe24.bitmall.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.CartVo;

@Repository
public class CartDao {
	
	@Autowired
	private SqlSession sqlSession;

	public int insert(CartVo vo) {
		return sqlSession.insert("cart.insert", vo);
	}

	public List<CartVo> getList(long no) {
		return sqlSession.selectList("cart.getByNo", no);
	}
}
