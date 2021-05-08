package com.example.todolist.service;

import com.example.todolist.dao.UserDao;
import com.example.todolist.entity.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServices {
    @Autowired
    private UserDao userDao;

    public void saveUsersData(Users users){
        userDao.saveUserData(users);
    }
    public Users getUserDataById(Long id){
        return userDao.getUsersDataById(id);
    }
    public Users getUserData(String username,String password){
        return userDao.getUserData(username,password);
    }
}
