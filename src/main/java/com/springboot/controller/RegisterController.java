package com.springboot.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.entity.User;

@Controller
public class RegisterController {
	
	@Autowired
	SessionFactory sessionFactory;
	
	@RequestMapping("/")
	public String login() {
		return "login";
	}
	
	@RequestMapping("register")
	public String register() {
		return "register";
	}
	
	@RequestMapping("saveToDB")
	public ModelAndView saveToDB(User user,HttpServletRequest request)throws Exception {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		user.setImagepath("/images/"+user.getImage().getOriginalFilename());
		session.save(user);
		transaction.commit();
		
		MultipartFile image = user.getImage();
		String foldername = request.getServletContext().getRealPath("/images");
		image.transferTo(new File(foldername,image.getOriginalFilename()));
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login");
		modelAndView.addObject("message","Registeration Successful");
		return modelAndView;
	}
}
