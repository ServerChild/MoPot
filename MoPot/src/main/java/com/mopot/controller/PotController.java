package com.mopot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.mopot.service.PotService;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PotController {

	@Autowired
	PotService potService;

	@RequestMapping("/pot")
	public String pot() {
		return "YS/pot";
	}

	@RequestMapping("/potWrite")
	public  String potWrite() {
		return  "YS/potWrite";
	}

	
}
