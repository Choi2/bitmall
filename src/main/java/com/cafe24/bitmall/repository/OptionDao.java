package com.cafe24.bitmall.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.OptionVo;

@Repository
public class OptionDao {
	@Autowired
	private SqlSession sqlSession;

	public List<OptionVo> getList() {
		return sqlSession.selectList("option.getList");
	}

	public int insert(OptionVo vo) {
		return sqlSession.insert("option.insert", vo); 
	}

	public OptionVo get(long no) {
		return sqlSession.selectOne("option.get", no);
	}
	
	
}
