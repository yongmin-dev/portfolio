package com.kh.member.svc;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.member.dao.MemberDAO;
import com.kh.member.vo.MemberVO;

@Service
public class MemberSVCImpl implements MemberSVC {

	
	private static final Logger logger
	 = LoggerFactory.getLogger(MemberSVCImpl.class);
	
	@Inject
	MemberDAO memberDAO;
	//===========================================================================
	//회원등록
	@Override
	public int joinMember(MemberVO memberVO) {
		logger.info("MemberSVCImp.joinMember 호출됨");
		return memberDAO.joinMember(memberVO);
	}
	
	//===========================================================================	
	//회원 수정
	@Override
	public int modifyMember(MemberVO memberVO) {
		logger.info("MemberSVCImp.modifyMember 호출");
		return memberDAO.modifyMember(memberVO);
	}

	//===========================================================================
	//회원 전체 조회
	@Override
	public List<MemberVO> selectAllMember() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	//===========================================================================
	//회원 개별조회, 로그인에도 쓰임
	@Override
	public MemberVO selectMember(String id) {
		logger.info("MemberSVCImpl.selectMember(String id) 호출됨");
		return memberDAO.selectMember(id);
	}
	
	//===========================================================================
	//회원탈퇴
	@Override
	public int outMember(String id, String pw) {
		logger.info("MemberSVCImpl.outMember(String id, String pw) 호출됨");
		return memberDAO.outMember(id, pw);
	}

	//===========================================================================
	//로그인
	@Override
	public MemberVO loginMember(String id, String pw) {
		logger.info("memberSVCImpl.loginMember(String id, String pw)호출됨");
		return memberDAO.loginMember(id, pw);
	}
	
	//===========================================================================
	//아이디 찾기
	@Override
	public String findID(String tel, Date birth) {
		logger.info("memberSVCimpl.findID 호출됨");
		return memberDAO.findID(tel, birth);
	}
	
	//===========================================================================
	//비밀번호 찾기
	@Override
	public int findPW(MemberVO memberVO) {
		logger.info("memberSVCImpl.findPW 호출");
		return memberDAO.findPW(memberVO);
	}

	//===========================================================================
	//비밀번호 변경
	@Override
	public int changePW(String id, String pw) {
		logger.info("memberSVCImpl.changePW 호출");
		
		return memberDAO.changePW(id, pw);
	}

}
