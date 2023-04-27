package com.hiteach.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserAdminController {

    @RequestMapping(value = {"/admin/user"}, method = RequestMethod.GET)
    public String blog() {
        return "admin/user";
    }

    @RequestMapping(value = {"/admin/updateinfor"}, method = RequestMethod.GET)
    public String updateinfor() {
        return "admin/updateinfor";
    }
}
