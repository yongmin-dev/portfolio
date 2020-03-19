package com.kh.member.vo;



import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Data;

@Entity
@Data
public class MemberVO {
	
	@NotNull
	@Pattern(regexp = "^\\w+@\\w+\\.\\w+(\\.\\w+)?$", message = "s:ex)aaa.@bbb.com" )
	private String id;
	
	@NotNull
	@Size(min = 6, max = 10, message = "s:비밀번호는 6~10자리로 입력바랍니다.")
	private String pw;
	
	@NotNull
	@Pattern(regexp = "^\\d{3}-\\d{3,4}-\\d{4}$", message = "s:ex)010-1234-5678")
	private String tel;
	
	@NotNull
	@Size(min =3, max = 10, message ="s:닉네임을 3~10자리로 입력바랍니다")
	private String nickname;
	
	@NotNull
	private String gender;
	
	@NotNull
	private String region;
	
	private Date birth;	
	
	private Timestamp cdate;
	
	private Timestamp udate;

}
