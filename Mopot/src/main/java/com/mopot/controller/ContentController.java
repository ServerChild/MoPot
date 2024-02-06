package com.mopot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.mopot.service.ContentService;

@Controller
public class ContentController {

	@Autowired
	ContentService contentService;
}
