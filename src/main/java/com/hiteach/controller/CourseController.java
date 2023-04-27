package com.hiteach.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CourseController {

    @RequestMapping(value = "/course", method = RequestMethod.GET)
    public String course(){
        return "user/course-archive";
    }

    @RequestMapping(value = "/coursedetail", method = RequestMethod.GET)
    public String coursedetail(){
        return "user/course-single";
    }

    @RequestMapping(value = "/coursemanager", method = RequestMethod.GET)
    public String courseManager(){
        return "user/coursemanager";
    }

    @RequestMapping(value = "/mycourse", method = RequestMethod.GET)
    public String mycourse(){
        return "user/mycourse";
    }

    @RequestMapping(value = "/uploadcourse", method = RequestMethod.GET)
    public String uploadcourse(){
        return "user/uploadcourse";
    }
}
