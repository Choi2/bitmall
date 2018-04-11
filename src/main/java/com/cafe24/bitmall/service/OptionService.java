package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.repository.OptionDao;
import com.cafe24.bitmall.vo.OptionVo;

@Service
public class OptionService {

	@Autowired
	private OptionDao optionDao;
	
	public List<OptionVo> getList() {
		return optionDao.getList();
	}

	public void insert(OptionVo vo) {
		optionDao.insert(vo);
	}

	public OptionVo get(OptionVo vo) {
		return optionDao.get(vo.getNo());
	}
	
}
