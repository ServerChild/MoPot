package com.mopot.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import com.mopot.domain.Member;
import com.mopot.service.MemberService;

import jakarta.servlet.http.HttpSession;

@Controller
@SessionAttributes({"loginUser"})
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	/*
	// 메인 페이지
	@RequestMapping("/")
	public String root() throws Exception {
		return "index";
	}
	*/
	
	// 회원가입 페이지
	@RequestMapping("/joinPage")
	public String joinPage() {
		return "Member/joinPage";
	}
	
	// 회원가입 - 회원 등록
	@PostMapping("/joinMember")
	public String InsertMember(Member member) {
		memberService.InsertMember(member);
		
		return "Member/joinSuccess";
	}
	
	
	// 회원가입 - 가입 시 ID 중복 체크
	@GetMapping("/idCheck")
	@ResponseBody
	public boolean idCheck(@RequestParam("id") String id) {
		return memberService.idCheck(id);
	}
	 
	// 로그인 페이지
	@RequestMapping("/loginPage")
	public String loginPage() {
		return "Member/loginPage";
	}
	
	// 로그인
	@PostMapping("/loginMember")
	public String loginMember(Member member, Model model) {
		Member loginUser = memberService.loginMember(member);
	    
		
		if(loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			
			return "redirect:/";
		} else {
			System.out.println(loginUser);
			
			return "Member/loginPage";
		}
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logoutMember(SessionStatus status) {
		if(!status.isComplete()) {
			status.setComplete();
		}
		
		return "redirect:/";
	}
	
	// 마이 페이지
	@RequestMapping("/myPage")
	public String myPage() {
		return "Member/myPage";
	}
	
	// 마이 페이지 - 회원 정보 조회
	@GetMapping("/myPageInfo")
	public String viewMyPage(Member member, Model model) {
		Member loginUser = memberService.loginMember(member);

	    if (loginUser != null) {
	        model.addAttribute("loginUser", loginUser);

	        return "Member/myPage";
	    } else {
	        return "redirect:/";
	    }
	}
	
	// 마이 페이지 - 회원 정보 수정
	@PostMapping("/myPageInfo")
	public String updateMyPage(@ModelAttribute("updateMember") Member updateMember, Model model) {
		Member loginMember = memberService.loginMember(updateMember);

		updateMember.setUserId(loginMember.getUserId());

		Member rMember = memberService.updateMyPage(updateMember);

		if(rMember != null) {
			model.addAttribute("loginUser", rMember);

			return "redirect:/";
		} else {
			return "redirect:/myPageInfo";
		}
	}
	
	// 마이 페이지 - 정보 수정 시 닉네임 중복 체크
	@GetMapping("/nickCheck")
	@ResponseBody
	public boolean nickCheck(@RequestParam("nick") String nick) {
		return memberService.nickCheck(nick);
	}
	
	// 마이 페이지 - 작성한 글, 댓글 조회
	
	// 마이 페이지 - 회원 탈퇴
	
}
