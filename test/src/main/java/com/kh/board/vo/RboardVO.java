package com.kh.board.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RboardVO {

	private long rnum; //댓글번호
	private long bnum; //게시글번호
	private String rid; // 작성자 ID
	private String rnickname; //작성자이름
	private Timestamp rcdate; //작성일
	private Timestamp rudate; // 수정일
	private String rcontent; //본문내용
	private int rgroup; //답글그룹
	private int rstep; // 답변글 단계
	private int rindent; // 답변글 들여쓰기
	private int prnum; // 부모댓글번호
	
}
