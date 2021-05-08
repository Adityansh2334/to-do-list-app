package com.example.todolist.dao;

import com.example.todolist.entity.Users;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.sql.rowset.serial.SerialBlob;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;

@Repository
public class UserDao {
    @Autowired
    private EntityManager entityManager;

    private Session getSession() {
        return entityManager.unwrap(Session.class);
    }
    public Session session;
        public void saveUserData(Users users){
            try {
                session = getSession();
                Transaction transaction = session.beginTransaction();
                MultipartFile image = users.getImage();
                byte[] bytes = image.getBytes();
                Blob serialBlob = new SerialBlob(bytes);
                users.setUser_image(serialBlob);
                session.save(users);
                transaction.commit();
            }catch (HibernateException | IOException | SQLException e){
                e.printStackTrace();
            }
        }
        public Users getUsersDataById(Long id){
            Users users=null;
            try{
                session = getSession();
                users=session.get(Users.class,id);
            }catch (HibernateException e){
                e.printStackTrace();
            }
            return users;
        }
        @SuppressWarnings("unchecked")
        public Users getUserData(String uname,String pass){
            Users users=null;
            try{
                session=getSession();
                String hql="from "+Users.class.getName()+" where user_name=:unm and user_password=:upp";
                Query<Users> query = session.createQuery(hql);
                query.setParameter("unm",uname).setParameter("upp",pass);
                users = query.uniqueResult();
            }catch (HibernateException e){
                e.printStackTrace();
            }
            return users;
        }

}
