package com.example.todolist.controller;

import com.example.todolist.awsConfig.BucketHandler;
import com.example.todolist.dto.LoginUserValid;
import com.example.todolist.entity.Notes;
import com.example.todolist.entity.Users;
import com.example.todolist.service.NoteServices;
import com.example.todolist.service.UserServices;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.MultipartStream;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.URL;
import java.nio.file.Files;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import java.util.Random;
import java.util.stream.IntStream;
import java.util.stream.LongStream;

@Controller
@RequestMapping("/")
public class UserController {

    @Autowired
    private UserServices userServices;
    @Autowired
    private NoteServices noteServices;
    @Autowired
    private BucketHandler bucketHandler;

    @RequestMapping(value = "/singupform", method = RequestMethod.POST)
    public ModelAndView signUpUser(Users users) {
        if (users.getImage().isEmpty()) {
            users.setUser_image(bucketHandler.getCommonImageUrl());
        }else{
        final URL url = bucketHandler.uplaodImage(users.getUser_fname(), users.getImage());
        users.setUser_image(url);
        }
        userServices.saveUsersData(users);
        return new ModelAndView("signin", "regSuccessMsg", "Registration Successful!");
    }

    @PostMapping("/signin")
    public ModelAndView getUserData(LoginUserValid loginUserValid, HttpServletRequest req) {
        Users userData = null;
        try {
            userData = userServices.getUserData(loginUserValid.getUsername(), loginUserValid.getPassword());
            if (userData != null) {
                List<Notes> notesByUser = noteServices.getNotesByUser(userData.getId());
                if (notesByUser != null) req.getSession().setAttribute("notesList", notesByUser);
                req.getSession().setAttribute("users", userData);
                return new ModelAndView("AddNoteWelcome", "userdata", userData);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ModelAndView("signin", "errorMsg", "User Invalid!" + "" +
                "</br> Please Check your Id & Password");
    }
}

