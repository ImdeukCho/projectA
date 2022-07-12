package com.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.member.dto.MemberDTO;

public class MemberDAO {
	
	public MemberDTO userLogin(SqlSession session, String userId) {
		MemberDTO dto = session.selectOne("com.member.dto.login", userId);
		return dto;
	}
	public List<MemberDTO> select(SqlSession session) {
		List<MemberDTO> list =  session.selectList("selectAll");
		return list;
	}

}
