package com.hiteach.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ContactController {

    @RequestMapping(value = "/help", method = RequestMethod.GET)
    public String blog(){
        return "user/help";
    }
}
