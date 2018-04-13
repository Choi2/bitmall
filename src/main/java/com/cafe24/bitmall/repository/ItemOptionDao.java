package com.cafe24.bitmall.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.ItemOptionVo;

@Repository
public class ItemOptionDao {
	
	@Autowired
	private SqlSession sqlSession;

	public int insert(ItemOptionVo vo) {
		return sqlSession.insert("itemoption.insert", vo);
	}

	public List<ItemOptionVo> getByNo(long no) {
		return sqlSession.selectList("itemoption.getByNo", no);
	}
}
