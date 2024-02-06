package com.mopot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.mopot.service.ReplyService;

@Controller
public class ReplyController {

	@Autowired
	ReplyService replyService;
}
