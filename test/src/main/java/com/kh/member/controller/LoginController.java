package com.kh.member.controller;

import java.io.Console;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.member.svc.MemberSVC;
import com.kh.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Inject
	MemberSVC memberSVC;

	// 로그인 페이지로 연결
	@GetMapping("/loginForm")
	public String login() {
		return "member/loginForm";
	}

	// 로그인
	@PostMapping("/login")
	public String loginOk(@RequestParam("id") String id, @RequestParam("pw") String pw, HttpSession session,
			Model model) {
		logger.info("id =" + id);
		logger.info("pw =" + pw);

		MemberVO memberVO = memberSVC.loginMember(id, pw);

		// 1) 회원이 없는 경우
		if (memberVO == null) {
			logger.info("login controller : 회원정보 없음");
			model.addAttribute("svr_msg", "가입된 회원정보가 없습니다");
		} else {
			// 2) 회원이 있는 경우
			// 2-1) 비밀번호가 일치하는 경우
			if(pw.equals(memberVO.getPw())) {
				session.setAttribute("member", memberVO);
				logger.info("로그인 성공");
				return "redirect:/";
			}else {
				//2-2) 비밀번호가 다른경우
				logger.info("로그인 실패");
				model.addAttribute("svr_msg", "비밀번호가 일치하지 않음");
			}
		}
		session.invalidate();
		return "member/loginForm";

	}

	//Logout
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
}




















