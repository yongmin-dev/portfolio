package com.kh.member.svc;

import java.sql.Date;
import java.util.List;

import com.kh.member.vo.MemberVO;

public interface MemberSVC {
	
	//회원가입
	int joinMember(MemberVO memberVO);
	
	
	//회원 수정
	int modifyMember(MemberVO memberVO);
	
	
	//회원 전체조회
	List<MemberVO> selectAllMember();
	
	
	//회원 개별조회
	MemberVO selectMember(String id);
	
	
	//회원 탈퇴
	int outMember(String id, String pw);
	
	
	//로그인
	MemberVO loginMember(String id, String pw);
	
	
	//아이디 찾기
	String findID(String tel, Date birth);
	
	
	//비밀번호 변경
	int findPW(MemberVO memberVO);
	
	
	//비밀번호 변경
	int changePW(String id, String pw);
}
