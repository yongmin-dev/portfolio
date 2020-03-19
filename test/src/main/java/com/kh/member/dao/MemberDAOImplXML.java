package com.kh.member.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.member.vo.MemberVO;

@Repository
public class MemberDAOImplXML implements MemberDAO {

	private static final Logger logger
	= LoggerFactory.getLogger(MemberDAOImplXML.class);
	
	@Inject
	private SqlSession sqlSession;
	//================================================================================
	//회원가입
	@Override
	public int joinMember(MemberVO memberVO) {
		logger.info("MemberDAOImplXML.joinMember 호출됨");
		return sqlSession.insert("memberMapper.joinMember",memberVO);

	}
	
	//================================================================================
	//회원조회
	@Override
	public MemberVO selectMember(String id) {
		logger.info("MemberDAOImplXML.selectMember 호출됨");
		return sqlSession.selectOne("memberMapper.selectMember", id);
	}

	//================================================================================
	//회원 수정
	@Override
	public int modifyMember(MemberVO memberVO) {
		logger.info("memberDAOImplXML.modifyMember(MemberVO memberVO 호출됨");
		return sqlSession.update("memberMapper.modifyMember", memberVO);
	}

	//================================================================================
	@Override
	public List<MemberVO> selectAllMember() {
		// TODO Auto-generated method stub
		return null;
	}

	//================================================================================
	//회원 탈퇴
	@Override
	public int outMember(String id, String pw) {
		logger.info("MemberDAOImplXML.outMember(String id, String pw) 호출됨");
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		return sqlSession.delete("memberMapper.outMember", map);
	}

	//================================================================================
	//로그인
	@Override
	public MemberVO loginMember(String id, String pw) {
		logger.info("memberDAOImplXML.loginMember(String id, string pw호출");
		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);
		memberVO.setPw(pw);
		
		return sqlSession.selectOne("memberMapper.loginMember", memberVO);
	}
	
	//================================================================================
	//아이디 찾기
	@Override
	public String findID(String tel, Date birth) {
		logger.info("memberDAOImplXML.findID 호출됨");
		MemberVO memberVO = new MemberVO();
		memberVO.setTel(tel);
		memberVO.setBirth(birth);
		
		return sqlSession.selectOne("memberMapper.findID", memberVO);
	}

	//================================================================================
	//비밀번호 찾기
	@Override
	public int findPW(MemberVO memberVO) {
		logger.info("memberDAOImplXML.findPW 호출");
		
		return sqlSession.selectOne("memberMapper.findPW", memberVO);
	}
	//================================================================================
	//비밀번호 변경
	@Override
	public int changePW(String id, String pw) {
		logger.info("memberDAOImplXML.changePW 호출");
		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);
		memberVO.setPw(pw);
		return sqlSession.update("memberMapper.changePW", memberVO);
	}
	


}
