package com.example.todolist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class WelcomeController {

    @RequestMapping("/welcome")
    public ModelAndView welcomeUser(){
        return new ModelAndView("/Welcome");
    }
    @RequestMapping("/signingo")
    public ModelAndView signInGo(){
        return new ModelAndView("/signin");
    }
    @RequestMapping("/signupgo")
    public ModelAndView signUpGo(){
        return new ModelAndView("/signup");
    }
}
