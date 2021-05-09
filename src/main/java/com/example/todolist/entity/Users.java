package com.example.todolist.entity;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.io.Serializable;
import java.net.URL;

@Entity
@Table(name = "user_data")
public class Users implements Serializable {
    private static final Long serUID=8392938859583L;

    @Id
    @GenericGenerator(name = "gen_id", strategy = "increment")
    @GeneratedValue(generator = "gen_id")
    @Column(name = "id")
    private Long id;
    @Column(name = "user_fname")
    private String user_fname;
    @Column(name = "user_lname")
    private String user_lname;
    @Column(name = "user_name")
    private String user_name;
    @Column(name = "user_dob")
    private String user_dob;
    @Column(name = "user_password")
    private String user_password;
    @Column(name = "user_gender")
    private String user_gender;
    @Column(name = "user_image")
    private URL user_image;
    @Transient
    private MultipartFile image;


    public void setId(Long id) {
        this.id = id;
    }
    public Long getId() {
        return id;
    }

    public String getUser_fname() {
        return user_fname;
    }

    public void setUser_fname(String user_fname) {
        this.user_fname = user_fname;
    }

    public String getUser_lname() {
        return user_lname;
    }

    public void setUser_lname(String user_lname) {
        this.user_lname = user_lname;
    }

    public String getUser_dob() {
        return user_dob;
    }

    public void setUser_dob(String user_dob) {
        this.user_dob = user_dob;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getUser_gender() {
        return user_gender;
    }

    public void setUser_gender(String user_gender) {
        this.user_gender = user_gender;
    }

    public URL getUser_image() {
        return user_image;
    }

    public void setUser_image(URL user_image) {
        this.user_image = user_image;
    }

    public MultipartFile getImage() {
        return image;
    }

    public void setImage(MultipartFile image) {
        this.image = image;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }



    @Override
    public String toString() {
        return "Users{" +
                "id=" + id +
                ", user_fname='" + user_fname + '\'' +
                ", user_lname='" + user_lname + '\'' +
                ", user_dob='" + user_dob + '\'' +
                ", user_password='" + user_password + '\'' +
                ", user_gender='" + user_gender + '\'' +
                '}';
    }
}
