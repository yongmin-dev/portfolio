package com.kh.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.common.Code;
import com.kh.member.svc.MemberSVC;
import com.kh.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberSVC memberSVC;

	@ModelAttribute
	public void initData(Model model) {

		List<Code> region = new ArrayList<>();
		region.add(new Code("서울", "서울"));
		region.add(new Code("경기", "경기"));
		region.add(new Code("인천", "인천"));
		region.add(new Code("대구", "대구"));
		region.add(new Code("울산", "울산"));
		region.add(new Code("전주", "전주"));
		model.addAttribute("region", region);

		// 성별
		List<Code> gender = new ArrayList<>();
		gender.add(new Code("남", "남자"));
		gender.add(new Code("여", "여자"));
		model.addAttribute("gender", gender);

	}

//================================================================================

	// 회원가입 양식
	@RequestMapping("/joinForm")
	public String memberJoinForm(Model model) {
		model.addAttribute("mvo", new MemberVO());
		return "member/joinForm";
	}

	// 회원등록
	@RequestMapping("/join")
	public String memberJoin(@Valid @ModelAttribute("mvo") MemberVO memberVO, BindingResult result, Model model) {
		logger.info(memberVO.toString());

		// 회원가입성공메세지 관련
		model.addAttribute("msg", "회원가입이 완료되었습니다");

		// 1)유효성 체크 중 오류가 발생되면 회원 가입 페이지로 이동
		if (result.hasErrors()) {
			return "member/joinForm";
		}

		// 2)회원 중복체크
		if (memberSVC.selectMember(memberVO.getId()) != null) {
			model.addAttribute("svr_msg", "중복된 아이디입니다");
			return "member/joinForm";
		}

		// 3)회원 가입처리
		int cnt = memberSVC.joinMember(memberVO);
		if (cnt == 1) {

			return "member/joinUp";
		} else {

			return "redirect:/";
		}
	}

//================================================================================
	// 회원수정양식
	@GetMapping("/modifyForm/{id:.+}")
	public String modifyForm(@PathVariable String id, Model model) {
		
		logger.info("memberVO:" + id);
		// 1) 현재 로그인한 회원정보 읽어오기
		MemberVO memberVO = memberSVC.selectMember(id);
		
		// 비밀번호 제거
		memberVO.setPw(null);
		model.addAttribute("mvo", memberVO);
		return "member/modifyForm";

	}

	// 회원수정 Action
	@PostMapping("/modify")
	public String modify(@Valid @ModelAttribute("mvo") MemberVO memberVO, BindingResult result, HttpSession session,
			Model model) {
		logger.info("/modify호출됨");
		// 회원가입성공메세지 관련
		model.addAttribute("msg_modify", "회원정보수정이 완료되었습니다");

		// 유효성 체크
		if (result.hasErrors()) {
			logger.info(result.getAllErrors().toString());
			// 비밀번호 제거
			memberVO.setPw(null);
			return "member/modifyForm";
		}
		// 회원정보 수정
		int cnt = memberSVC.modifyMember(memberVO);
		logger.info("수정처리결과:" + cnt);

		// 세션정보 수정
		session.removeAttribute("member");
		session.setAttribute("member", memberVO);

		return "member/modifyUp";
		// return "redirect:/member/modifyForm/"+memberVO.getId();

	}

//================================================================================
	// 회원탈퇴
	@GetMapping("/outForm")
	public String outForm() {
		return "member/outForm";
	}

	// 회원 탈퇴 action
	@PostMapping("/out")
	public String out(@RequestParam("id") String id, @RequestParam("pw") String pw, HttpSession session, Model model) {
		model.addAttribute("msg_out", "회원탈퇴가 완료되었습니다");
		int cnt = memberSVC.outMember(id, pw);
		if (cnt == 1) {
			session.invalidate();
			return "member/outUp";
		}
		model.addAttribute("svr_msg", "비밀번호가 잘못되었습니다.");
		return "member/outForm";
	}

// ================================================================================

	@GetMapping("/findIDForm")
	public String findIDForm() {

		return "member/findIDForm";
	}

	// 아이디 찾기 post 방식
	@PostMapping(value = "/id", produces = "application/json")
	@ResponseBody
	public ResponseEntity<Map> findId(@RequestBody MemberVO memberVO) {
		ResponseEntity<Map> res = null;
		String findId = null;
		logger.info("tel:" + memberVO.getTel());
		logger.info("birth:" + memberVO.getBirth());

		// java.SQL.date 타입으로 변환
		memberVO.setBirth(java.sql.Date.valueOf(memberVO.getBirth().toString()));

		// 아이디 찾기 service 호출
		findId = memberSVC.findID(memberVO.getTel(), memberVO.getBirth());
		Map<String, Object> map = new HashMap();
		if (findId != null) {
			map.put("success", true);
			map.put("id", findId);
			res = new ResponseEntity<Map>(map, HttpStatus.OK);
		} else {
			map.put("success", false);
			map.put("id", findId);
			map.put("msg", "찾고자 하는 아이디 없음");
			res = new ResponseEntity<Map>(map, HttpStatus.OK);

		}
		return res;

	}
	// ================================================================================

	// 비밀번호 변경 화면
	@GetMapping("/findPWForm")
	public String findPWForm() {
		return "member/findPWForm";
	}

	// 비밀번호 변경 대상 찾기
	@PostMapping(value = "/findPW", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Map> findPW(@RequestBody MemberVO memberVO) {
		ResponseEntity<Map> res = null;
		logger.info("비밀번호 대상 찾기 요청: " + memberVO);

		// 2)비밀번호 변경 대상 찾기

		memberVO.setBirth(java.sql.Date.valueOf(memberVO.getBirth().toString()));
		int cnt = memberSVC.findPW(memberVO);
		Map<String, Boolean> map = new HashMap<>();

		if (cnt == 1) {
			map.put("success", true);
			res = new ResponseEntity<Map>(map, HttpStatus.OK);
		} else {
			map.put("sucess", false);
			res = new ResponseEntity<Map>(map, HttpStatus.OK);
		}
		return res;

	}

	// 비밀번호 변경
	@PostMapping(value = "/changePW", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Map> changePW(@RequestBody MemberVO memberVO) {
		ResponseEntity<Map> res = null;
		logger.info("비밀번호 변경 "+res);
		int cnt = memberSVC.changePW(memberVO.getId(), memberVO.getPw());
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		if (cnt == 1) {
			map.put("success", true);
			res = new ResponseEntity<Map>(map, HttpStatus.OK);
		} else {
			map.put("success", false);
			res = new ResponseEntity<Map>(map, HttpStatus.OK);
		}
		return res;

	}

}
