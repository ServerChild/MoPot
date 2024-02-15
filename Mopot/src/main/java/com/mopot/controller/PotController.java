package com.mopot.controller;

import com.mopot.service.PotService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PotController {

    @Autowired
    PotService potService;

    @RequestMapping("/pot")
    public String potContent() {
        return "Pot/pot";
    }
}

