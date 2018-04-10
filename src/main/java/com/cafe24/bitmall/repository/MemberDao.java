package com.cafe24.bitmall.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.MemberVo;

@Repository
public class MemberDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean insert(MemberVo vo) {
		return (sqlSession.insert("member.insert", vo) == 1); 
	}

	public List<MemberVo> getList() {
		return sqlSession.selectList("member.getList");
	}
	
	
}
