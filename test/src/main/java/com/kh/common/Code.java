package com.kh.common;

import javax.persistence.Entity;

import lombok.Data;

@Data
@Entity
public class Code {
private String code;
private String label;
	
public Code(String code, String label) {
	this.code = code;
	this.label = label;
}

}
