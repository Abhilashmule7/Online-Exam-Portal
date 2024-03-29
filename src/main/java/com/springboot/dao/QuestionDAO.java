package com.springboot.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springboot.entity.Question;

@Repository
public class QuestionDAO 
{	
	@Autowired
	SessionFactory sessionFactory;
	
	public List<Question> getAllQuestions(String subject)
	{
		Session session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Question.class);
		criteria.add(Restrictions.eq("subject",subject));		
		return criteria.list();
	}
}
