package com.hiteach.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BlogAdminController {

    @RequestMapping(value = {"/admin/blog"}, method = RequestMethod.GET)
    public String blog() {
        return "admin/blogadmin";
    }

    @RequestMapping(value = {"/admin/addblog"}, method = RequestMethod.GET)
    public String addblog() {
        return "admin/addblog";
    }
}
