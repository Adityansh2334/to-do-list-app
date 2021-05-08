package com.example.todolist.service;

import com.example.todolist.dao.NoteDao;
import com.example.todolist.entity.Notes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoteServices {
    @Autowired
    NoteDao noteDao;

    public void saveNotes(Notes notes){
        noteDao.saveNote(notes);
    }
    public List<Notes> getNotesByUser(Long id){
        return noteDao.getNotesByUserId(id);
    }
    public void deleteNoteByUser(Long id,String createDt){
        noteDao.deleteNoteByUserId(id,createDt);
    }
    public void updateNoteByUser(Long id,String crDt,String newNote,String tDt,Integer pref){
        noteDao.updateNotesByUserId(id,crDt,newNote,tDt,pref);
    }

}
