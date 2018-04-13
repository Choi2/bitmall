package com.cafe24.bitmall.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.MemberOptionVo;

@Repository
public class MemberOptionDao {
	
	@Autowired
	private SqlSession sqlSession;

	public int insert(MemberOptionVo vo) {
		return sqlSession.insert("memberoption.insert", vo);
	}

	public List<MemberOptionVo> getByCartNo(long no) {
		return sqlSession.selectList("memberoption.getByCartNo", no);
	}
}
