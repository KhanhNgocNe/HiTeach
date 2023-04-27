package com.hiteach.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MajorAdminController {

    @RequestMapping(value = {"/admin/major"}, method = RequestMethod.GET)
    public String blog() {
        return "admin/major";
    }

    @RequestMapping(value = {"/admin/addmajor"}, method = RequestMethod.GET)
    public String addblog() {
        return "admin/addmajor";
    }
}
