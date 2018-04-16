package com.cafe24.bitmall.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.ImageVo;

@Repository
public class ImageDao {
	
	@Autowired 
	private SqlSession sqlSession;

	public int insert(ImageVo vo) {
		return sqlSession.insert("image.insert", vo);
	}

	public int update(ImageVo image) {
		return sqlSession.update("image.update", image);
	}	
}
