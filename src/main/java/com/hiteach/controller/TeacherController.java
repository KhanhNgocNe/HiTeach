package com.hiteach.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TeacherController {

    @RequestMapping(value = "/teachers", method = RequestMethod.GET)
    public String teachers(){
        return "user/teacher";
    }

    @RequestMapping(value = "/teacherdetail", method = RequestMethod.GET)
    public String teacherdetail(){
        return "user/teacher-single";
    }
}
