package com.kh.board.vo;

import javax.persistence.Entity;
import javax.validation.constraints.Positive;

import lombok.Data;

@Entity
@Data
public class BoardCategoryVO {

	@Positive(message = "분류를 선택하세요")
	private long cid;
	private String cname;
	
}
