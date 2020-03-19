package com.kh.board.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.board.svc.RboardSVC;
import com.kh.board.vo.RboardVO;

//@RestController
//@RequestMapping("/rboard")
public class RboardController {

	private static Logger logger = LoggerFactory.getLogger(RboardController.class);

	@Inject
	RboardSVC rboardSVC;

	// 댓글 작성
	@PostMapping(value = "", produces = "application/json")
	public ResponseEntity<String> write(@RequestBody(required = true) RboardVO rboardVO) {
		ResponseEntity res = null;
		logger.info("write() 호출됨");
		logger.info("rboardVO : " + rboardVO.toString());

		// 유효성체크
		if (rboardVO.getBnum() > 0 && rboardVO.getRid() != null && rboardVO.getRnickname() != null
				&& rboardVO.getRcontent() != null) {

			// 댓글작성
			rboardSVC.write(rboardVO);

			// 성공
			res = new ResponseEntity<String>("sucess", HttpStatus.OK); // 200
		} else {

			// 실패
			res = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST); // 400

		}
		return res;
	}

}
