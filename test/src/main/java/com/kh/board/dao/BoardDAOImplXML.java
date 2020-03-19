package com.kh.board.dao;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.board.vo.BoardCategoryVO;
import com.kh.board.vo.BoardFileVO;
import com.kh.board.vo.BoardVO;

@Repository
public class BoardDAOImplXML implements BoardDAO {

	public final static Logger logger = LoggerFactory.getLogger(BoardDAOImplXML.class);

	@Inject
	private SqlSession sqlSession;

	// 카테고리 읽어오기
	@Override
	public List<BoardCategoryVO> getCategory() {
		return sqlSession.selectList("boardMapper.getCategory");
	}

	// 게시물 작성
	@Override
	public int write(BoardVO boardVO) {
		return sqlSession.insert("boardMapper.write", boardVO);

	}

	// 첨부파일 저장
	@Override
	public int fileWrite(BoardFileVO boardFileVO) {
		return sqlSession.insert("boardMapper.fileWrite", boardFileVO);
	}

	// 게시글 수정하기
	@Override
	public int modify(BoardVO boardVO) {
		return sqlSession.update("boardMapper.modify", boardVO);
	}

	// 게시글 보기
	@Override
	public BoardVO view(String bnum) {
		return sqlSession.selectOne("boardMapper.view", Long.valueOf(bnum));
	}

	// 게시글 보기
	@Override
	public List<BoardFileVO> fileViews(String bnum) {
		return sqlSession.selectList("boardMapper.fileViews", Long.valueOf(bnum));
	}

	// 조회수 1 증가
	@Override
	public int updateHit(String bnum) {
		return sqlSession.update("boardMapper.updateHit", Long.valueOf(bnum));
	}

	// 게시글 목록
	// 1) 전체
	@Override
	public List<BoardVO> list() {
		return sqlSession.selectList("boardMapper.list");
	}

	// 2) 검색어 없는 게시글 페이징
	@Override
	public List<BoardVO> list(int startRec, int endRec) {
		Map<String, Object> map = new HashMap<>();
		map.put("startRec", startRec);
		map.put("endRec", endRec);
		return sqlSession.selectList("boardMapper.list2", map);
	}

	// 3) 검색어 있는 게시글 검색(전체, 제목, 내용, 작성자ID, 별칭)
	@Override
	public List<BoardVO> list(int startRec, int endRec, String searchType, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("startRec", startRec);
		map.put("endRec", endRec);
		map.put("keyword", keyword);
		map.put("searchType",searchType);
		if (keyword != null) {
			map.put("list", Arrays.asList(keyword.split("\\s+")));
		}
		map.put("andor", "or");

		return sqlSession.selectList("boardMapper.list3", map);
	}

	// 총 레코드 수
	@Override
	public int totalRecordCount(String searchType, String keyword) {
		logger.info("keyword" + keyword);
		Map<String, Object> map = new HashMap<>();
		map.put("searchType", searchType);

		if (keyword != null) {
			map.put("list", Arrays.asList(keyword.split("\\s+")));
		}
		map.put("andor", "or");
		logger.info("keyword2 :" + map.get("list"));
		return sqlSession.selectOne("boardMapper.totalRecordCount", map);

	}

	// 게시글 답글 작성
	@Override
	public int reply(BoardVO boardVO) {
		// 1 이전답글 스텝 업데이트
		updateStep(boardVO.getBgroup(), boardVO.getBstep());
		// 2 답글달기
		return sqlSession.insert("boardMapper.reply", boardVO);
	}

	// 이전 답글 step 업데이트
	private int updateStep(int bgroup, int bstep) {
		Map<String, Object> map = new HashMap();
		map.put("bgroup", bgroup);
		map.put("bstep", bstep);
		return sqlSession.update("boardMapper.updateStep", map);
	}

	// 첨부파일 조회
	@Override
	public BoardFileVO fileView(String fid) {
		return sqlSession.selectOne("boardMapper.fileview", Long.valueOf(fid));
	}

//======================================================================================================
	// 게시글 삭제
	@Override
	public int delete(String bnum) {
		return sqlSession.delete("boardMapper.delete", Long.valueOf(bnum));
	}

	//파일 삭제
	@Override
	public int fileDelete(String fid) {
		return sqlSession.delete("boardMapper.fileDelete", Long.valueOf(fid));
	}

	//복수 파일 삭제
	@Override
	public int filesDelete(String bnum) {
		return sqlSession.delete("boardMapper.filesDelete", Long.valueOf(bnum));
	}

}
