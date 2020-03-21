package com.kh.board.svc;

import java.util.List;

import com.kh.board.vo.VoteVO;
import com.kh.comment.CboardVO;

public interface RboardSVC {
	
	//댓글 작성
	int write(CboardVO rboardVO);
	
	//댓글 목록
	List<CboardVO> list(int bnum, int startRec, int endRec);
	
	//댓글 수정
	int modify(CboardVO rboardVO);
	
	//댓글 삭제
	int delete(String rnum);
	
	//대댓글 작성
	int reply(CboardVO rboardVO);
	
	//댓글 호감, 비호감
	//투표여부 체크
	int checkVote(VoteVO voteVO);
	
	
	int mergeVote(VoteVO voteVO);
	
	//댓글 총계
	int replyTotalRec(String bnum);
	
	

}
