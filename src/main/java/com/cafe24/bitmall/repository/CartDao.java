package com.cafe24.bitmall.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.CartVo;
import com.cafe24.bitmall.vo.ItemVo;

@Repository
public class CartDao {
	
	@Autowired
	private SqlSession sqlSession;

	public int insert(ItemVo vo, long memberNo) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("memberNo", memberNo);
		parameters.put("vo", vo);
		return sqlSession.insert("cart.insert", parameters);
	}

	public List<CartVo> getList(long no) {
		return sqlSession.selectList("cart.getByNo", no);
	}
}
