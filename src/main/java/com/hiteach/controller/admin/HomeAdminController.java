package com.hiteach.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeAdminController {

    @RequestMapping(value = {"/admin/home","/admin"}, method = RequestMethod.GET)
    public String getHomePage() {
        return "admin/index";
    }
}
