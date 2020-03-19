package com.kh.board.vo;

import lombok.Data;

@Data
public class VoteVO {

	private long rnum;   //댓글번호
	private long bnum;	//게시글번호
	private String rid;	//투표자
	private String vote;	//댓글선호도 1=호감, 2=비호감
	
}
