package com.springboot.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.dao.QuestionDAO;
import com.springboot.entity.Answer;
import com.springboot.entity.Question;
import com.springboot.entity.User;

@Controller
public class LoginController
{

	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired
	QuestionDAO questionDAO;
	
	@RequestMapping("validate")
	public ModelAndView validate(String username,String password,String subject,HttpServletRequest request) {
	
		ModelAndView modelAndView = new ModelAndView();
		
		System.out.println(request.getMethod());
		
		System.out.println(username + " " + password);
		
		Session session = sessionFactory.openSession();
		User userFromDB = session.get(User.class, username); 
		
		if(userFromDB==null) {
			modelAndView.setViewName("login");
			modelAndView.addObject("message","Username Invalid");
		}else if(password.equals(userFromDB.getPassword())) {
			modelAndView.setViewName("question");
			
			List<Question> list = questionDAO.getAllQuestions(subject);
			
			System.out.println(list);
			
			Question question = list.get(0);
		
			
			System.out.println(question);
			
			modelAndView.addObject("question",question);
			
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("imagepath",userFromDB.getImagepath());
			
			httpSession.setAttribute("question",question);
			httpSession.setAttribute("questions",list);
			httpSession.setAttribute("qno",0);
			httpSession.setAttribute("score",0);
			
			HashMap<Integer,Answer> hashMap = new HashMap<Integer,Answer>();
			
			httpSession.setAttribute("submittedDetails",hashMap);
			
		}else {
			modelAndView.setViewName("login");
			modelAndView.addObject("message","Password Invalid");
		}
		return modelAndView;
	}
} 
