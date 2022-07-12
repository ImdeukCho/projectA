package com.member.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.member.config.MySqlSessionFactory;
import com.member.dao.MemberDAO;
import com.member.dto.MemberDTO;

public class MemberService {
	
	private MemberDAO dao;
	
	public MemberService() {
		dao = new MemberDAO();
	}
	public MemberDTO userLogin(String userId) {
		SqlSession session = MySqlSessionFactory.getSession();
		MemberDTO dto = null;
		 try {
			 dto = dao.userLogin(session,userId);
	    	 session.commit();
//	      }catch(Exception e) {
//	    	  e.printStackTrace();
	      }finally {
			session.close();
	      }
	      return dto;
		}//end select
	
	public List<MemberDTO> select() {
	 SqlSession session = MySqlSessionFactory.getSession();
	 List<MemberDTO> list = null; 
	 try {
      list = dao.select(session);
    	  
//      }catch(Exception e) {
//    	  e.printStackTrace();
      }finally {
		session.close();
      }
      return list;
	}//end select

}
