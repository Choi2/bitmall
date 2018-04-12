package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.repository.OptionValueDao;
import com.cafe24.bitmall.vo.OptionValueVo;

@Service
public class OptionValueService {
	@Autowired
	private OptionValueDao optionValueDao;

	public List<OptionValueVo> get(long no) {
		return optionValueDao.getByNo(no);
	}
	
	
}
