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

	public MemberVo get(MemberVo vo) {
		return sqlSession.selectOne("member.get", vo);
	}

	public MemberVo getByNo(long memberNo) {
		return sqlSession.selectOne("member.getByNo", memberNo);
	}

	public int updateMember(MemberVo member) {
		return sqlSession.update("member.updateMember", member);
	}

	public int delete(long memberNo) {
		return sqlSession.delete("member.delete", memberNo);
	}
	
	
}
