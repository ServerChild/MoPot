package com.mopot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.mopot.service.PotService;

@Controller
public class PotController {

	@Autowired
	PotService potService;
}
