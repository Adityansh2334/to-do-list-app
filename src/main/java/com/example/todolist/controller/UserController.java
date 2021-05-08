package com.example.todolist.controller;

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
import java.nio.file.Files;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

@Controller
@RequestMapping("/")
public class UserController {

    @Autowired
    private UserServices userServices;
    @Autowired
    private NoteServices noteServices;

    @RequestMapping(value = "/singupform",method = RequestMethod.POST)
    public ModelAndView signUpUser(Users users) {
        if(users.getImage().isEmpty()){
            try {
                File f= new File("images\\common.png");
                FileItem ft= new DiskFileItem("mainfile", Files.probeContentType(f.toPath()),
                        false,f.getName(),(int)f.length(),f.getParentFile());
                IOUtils.copy(new FileInputStream(f),ft.getOutputStream());
                MultipartFile cf= new CommonsMultipartFile(ft);
                users.setImage(cf);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        userServices.saveUsersData(users);
        return new ModelAndView("signin","regSuccessMsg","Registration Successful!");
    }

    @PostMapping("/signin")
    public ModelAndView getUserData(LoginUserValid loginUserValid, HttpServletRequest req){
        Users userData=null;
        FileOutputStream fos=null;
        try{
            userData = userServices.getUserData(loginUserValid.getUsername(), loginUserValid.getPassword());
            if(userData!=null){
                Blob image = userData.getUser_image();
                byte[] bytes = image.getBytes(1, (int)image.length());
                fos=new FileOutputStream("images\\image1.png");
                fos.write(bytes);
                fos.flush();
                System.out.println("write image completed");
                List<Notes> notesByUser = noteServices.getNotesByUser(userData.getId());
                if(notesByUser!=null)req.getSession().setAttribute("notesList",notesByUser);
                req.getSession().setAttribute("users",userData);
                return new ModelAndView("AddNoteWelcome","userdata",userData);
            }
            }catch (Exception e){
                e.printStackTrace();
            }finally {
            try {
               if(fos!=null) fos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return new ModelAndView("signin","errorMsg","User Invalid!"+"" +
                "</br> Please Check your Id & Password");
        }
    }

