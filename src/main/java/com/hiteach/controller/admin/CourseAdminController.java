package com.hiteach.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CourseAdminController {

    @RequestMapping(value = {"/admin/course"}, method = RequestMethod.GET)
    public String blog() {
        return "admin/course";
    }
}
