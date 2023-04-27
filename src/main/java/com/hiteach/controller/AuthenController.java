package com.hiteach.controller;

import com.hiteach.entity.User;
import com.hiteach.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthenController {

    @Autowired
    private UserRepository userRepository;

    @RequestMapping(value = "/keyactive", method = RequestMethod.GET)
    public String activeAccount(@RequestParam("key") String key){
        User u =userRepository.getUserByActivationKey(key).get();
        u.setActived(1);
        userRepository.save(u);
        return "redirect:login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(){
        return "user/login";
    }

    @RequestMapping(value = "/regis", method = RequestMethod.GET)
    public String regis(){
        return "user/regis";
    }

    @RequestMapping(value = "/updateinfor", method = RequestMethod.GET)
    public String updateaccount(){
        return "user/updateinfo";
    }

    @RequestMapping(value = "/forgetpass", method = RequestMethod.GET)
    public String forgetpass(){
        return "user/forgetpass";
    }

}
