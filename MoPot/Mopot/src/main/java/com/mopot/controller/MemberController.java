package com.mopot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.mopot.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
}