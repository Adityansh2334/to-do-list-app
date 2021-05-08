package com.example.todolist.dao;

import com.example.todolist.entity.Notes;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import java.util.List;

@Repository
public class NoteDao {
        @Autowired
        private EntityManager entityManager;

        private Session getSession() {
        return entityManager.unwrap(Session.class);
    }
        public Session session;
        public void saveNote(Notes notes){
            session=getSession();
            Transaction transaction = session.beginTransaction();
            session.save(notes);
            transaction.commit();
        }
        @SuppressWarnings("unchecked")
        public List<Notes> getNotesByUserId(Long id){
            List<Notes> notes=null;
            session=getSession();
            String hql="from "+Notes.class.getName()+" where users.id=:id order by user_preference asc";
            Query<Notes> query = session.createQuery(hql);
            query.setParameter("id",id);
            notes=query.getResultList();
            return notes;
        }
    @SuppressWarnings("unchecked")
    public void deleteNoteByUserId(Long id,String createDt){
            session=getSession();
            Transaction transaction = session.beginTransaction();
            String hql="delete "+Notes.class.getName()+" where users.id=:id and create_date=:dt";
            Query<Notes> query = session.createQuery(hql);
            query.setParameter("id",id).setParameter("dt",createDt);
            query.executeUpdate();
            transaction.commit();
            System.out.println("deleted");
        }
        @SuppressWarnings("unchecked")
        public void updateNotesByUserId(Long id,String creatDt,String note,String tDt,Integer pref){
            session=getSession();
            Transaction transaction = session.beginTransaction();
            String hql="update "+Notes.class.getName()+" set user_note=:nt,target_date=:td,user_preference=:pref where users.id=:id and create_date=:dt";
            Query<Notes> query = session.createQuery(hql);
            query.setParameter("id",id).setParameter("dt",creatDt).setParameter("nt",note).setParameter("td",tDt).
            setParameter("pref",pref);
            query.executeUpdate();
            transaction.commit();
            System.out.println("updated");
        }

}
