package com.kh.board.vo;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Entity
@Data
public class BoardVO {

	private long bnum;
	
	@Valid
	private BoardCategoryVO boardCategoryVO;
	
	@NotNull
	@Size(min=4, max=50, message="5~50자 이내로 작성하세요")
	private String btitle;
	
	private String bid;
	private String bnickname;
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Timestamp bcdate;
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Timestamp budate;
	
	private int bhit;
	
	@NotNull(message="내용을 입력하세요")
	@Size(min=4, message="5자 이상으로 작성하세요")
	private String bcontent;
	private int bgroup;
	private int bstep;
	private int bindent;
	
	private List<MultipartFile> files;
}
