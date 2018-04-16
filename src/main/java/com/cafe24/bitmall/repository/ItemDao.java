package com.cafe24.bitmall.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.ItemVo;

@Repository
public class ItemDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int insert(ItemVo vo) {
		return sqlSession.insert("item.insert", vo); 
	}

	public List<ItemVo> getList() {
		return sqlSession.selectList("item.getList");
	}
	
	public List<ItemVo> getListByCategoryNo(long categoryNo) {
		return sqlSession.selectList("item.getListByCategoryNo", categoryNo);
	}

	public ItemVo getByNo(long no) {
		return sqlSession.selectOne("item.getByNo", no);
	}

	public int delete(long itemNo) {
		return sqlSession.delete("item.delete", itemNo);
	}

	public int update(ItemVo vo) {
		return sqlSession.update("item.update", vo);
	}

}
