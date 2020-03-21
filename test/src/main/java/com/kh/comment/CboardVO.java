package com.kh.comment;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CboardVO {

	private long cnum; //댓글번호
	private long bnum; //게시글번호
	private String cid; // 작성자 ID
	private String cnickname; //작성자이름
	
	@JsonFormat(pattern = "yyyy-MM-dd h:mm a", timezone = "Asia/Seoul")
	private Timestamp rcdate; //작성일
	@JsonFormat(pattern = "yyyy-MM-dd h:mm a", timezone = "Asia/Seoul")
	private Timestamp cudate; // 수정일
	private String ccontent; //본문내용
	private int cgroup; //답글그룹
	private int cstep; // 답변글 단계
	private int cindent; // 답변글 들여쓰기
	private int pcnum; // 부모댓글번호
	
	private int good; // 선호
	private int bad; // 비선호
	
}
