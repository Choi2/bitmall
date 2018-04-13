package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.repository.ItemOptionDao;
import com.cafe24.bitmall.vo.ItemOptionVo;

@Service
public class ItemOptionService {
	@Autowired
	private ItemOptionDao itemOptionDao;

	public List<ItemOptionVo> get(long no) {
		return itemOptionDao.getByNo(no);
	}
	
	
}
