package com.hiteach.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BlogController {

    @RequestMapping(value = "/blog", method = RequestMethod.GET)
    public String blog(){
        return "user/blog-archive";
    }

    @RequestMapping(value = "/blogdetail", method = RequestMethod.GET)
    public String blogdetail(){
        return "user/blog-single";
    }
}
