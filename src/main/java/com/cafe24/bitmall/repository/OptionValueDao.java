package com.cafe24.bitmall.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.OptionValueVo;

@Repository
public class OptionValueDao {
	
	@Autowired
	private SqlSession sqlSession;

	public int insert(OptionValueVo vo) {
		return sqlSession.insert("optionvalue.insert", vo);
	}

	public List<OptionValueVo> getByNo(long no) {
		return sqlSession.selectList("optionvalue.getByNo", no);
	}
}
