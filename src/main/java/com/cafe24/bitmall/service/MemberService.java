package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.repository.MemberDao;
import com.cafe24.bitmall.vo.MemberVo;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	
	public void addMember(MemberVo vo) {
		vo.setAuth("user");
		memberDao.insert(vo);
	}

	public MemberVo getMember(MemberVo vo) {
		return null;
	}

	public List<MemberVo> getList() {
		return memberDao.getList();
	}
}
