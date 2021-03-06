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
		return memberDao.get(vo);
	}

	public List<MemberVo> getList() {
		return memberDao.getList();
	}

	public MemberVo getMember(long memberNo) {
		return memberDao.getByNo(memberNo);
	}

	public void modifyMember(MemberVo member) {
		memberDao.updateMember(member);
	}

	public void delete(long memberNo) {
		memberDao.delete(memberNo);
	}
}
