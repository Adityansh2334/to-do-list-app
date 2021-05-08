package com.example.todolist.controller;

import com.example.todolist.entity.Notes;
import com.example.todolist.entity.Users;
import com.example.todolist.service.NoteServices;
import com.example.todolist.service.UserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class AddNoteController {
    @Autowired
    private NoteServices noteServices;
    @Autowired
    private UserServices userServices;

    @PostMapping("/savenote")
    public ModelAndView addNote(Notes notes, HttpServletRequest req){
        Users userdata = (Users) req.getSession().getAttribute("users");
        if(userdata!=null && notes!=null) {
            notes.setUsers(userServices.getUserDataById(userdata.getId()));
            noteServices.saveNotes(notes);
            req.getSession().setAttribute("notesList",noteServices.getNotesByUser(userdata.getId()));
            return new ModelAndView("AddNoteWelcome","userdata",userdata);
        }
        System.out.println("null found");
        return new ModelAndView("AddNoteWelcome");
    }
    @RequestMapping("/addview")
    public ModelAndView addNoteView(HttpServletRequest req){
        req.setAttribute("s1",null);
        req.setAttribute("s2",null);
        return new ModelAndView("AddUpdateNote");
    }

    @GetMapping("/updateserv")
    public ModelAndView updateNoteView(Notes notes,HttpServletRequest req) {
        req.setAttribute("s1",notes.getUser_note());
        req.setAttribute("s2",notes.getCreate_date());
        return new ModelAndView("AddUpdateNote");
    }

    @PostMapping("/noteupdate")
    public ModelAndView updateNote(Notes notes, HttpServletRequest req){
        Users userData=(Users)req.getSession().getAttribute("users");
        if(userData !=null){
            noteServices.updateNoteByUser(userData.getId(),notes.getCreate_date(),notes.getUser_note()
            ,notes.getTarget_date(),notes.getUser_preference());
            List<Notes> notesByUser = noteServices.getNotesByUser(userData.getId());
            if(notesByUser!=null)req.getSession().setAttribute("notesList",notesByUser);
            return new ModelAndView("AddNoteWelcome","userdata",userData);
        }
        System.out.println("null in 2nd");
        return new ModelAndView("AddNoteWelcome");
    }
    @GetMapping("/notedelete")
    public ModelAndView deleteNoteByUsers(Notes notes,HttpServletRequest req) {
        Users userData = (Users) req.getSession().getAttribute("users");
        if (userData != null) {
            noteServices.deleteNoteByUser(userData.getId(),notes.getCreate_date());
            List<Notes> notesByUser = noteServices.getNotesByUser(userData.getId());
            if (notesByUser != null) req.getSession().setAttribute("notesList", notesByUser);
            return new ModelAndView("AddNoteWelcome", "userdata", userData);
        }
        return new ModelAndView("AddNoteWelcome");
    }
    @RequestMapping("/backtoView")
    public ModelAndView backView(HttpServletRequest req){
        Users userData = (Users) req.getSession().getAttribute("users");
        if (userData != null) {
            List<Notes> notesByUser = noteServices.getNotesByUser(userData.getId());
            if (notesByUser != null) req.getSession().setAttribute("notesList", notesByUser);
            return new ModelAndView("AddNoteWelcome", "userdata", userData);
        }
        return  new ModelAndView("AddNoteWelcome");
    }

}
