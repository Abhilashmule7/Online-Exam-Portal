package com.springboot.controller;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.entity.Answer;
import com.springboot.entity.Question;

@Controller
public class QuestionController {
	
	@RequestMapping("next")
	public ModelAndView next(HttpServletRequest request,Answer answer) {
		HttpSession httpSession = request.getSession();
		
		if(request.getParameter("submittedAnswer")!=null) 
		{
			HashMap<Integer,Answer> hashMap = (HashMap<Integer, Answer>) httpSession.getAttribute("submittedDetails");
			
			hashMap.put(answer.getQno(), answer);
			System.out.println(hashMap);
		}
		Question question=null;
		ModelAndView modelAndView = new ModelAndView();
		
		List<Question> listofquestions = (List<Question>) httpSession.getAttribute("questions");
		
		if((Integer)httpSession.getAttribute("qno") <= listofquestions.size()-2)
		{
			
		httpSession.setAttribute("qno",(Integer)httpSession.getAttribute("qno") + 1);	
		
		question = listofquestions.get((Integer)httpSession.getAttribute("qno"));
		
		}
		
		else
		{
			question = listofquestions.get(listofquestions.size()-1);
			modelAndView.addObject("message","questions over.click on previous button");
		}
		
		modelAndView.addObject("question",question);
		modelAndView.setViewName("question");
		
		return modelAndView;
	}
	
	@RequestMapping("previous")
	public ModelAndView previous(HttpServletRequest request) {
		
		Question question=null;
		
		ModelAndView modelAndView = new ModelAndView();
		
		HttpSession httpSession = request.getSession();
		
		List<Question> listofquestions = (List<Question>) httpSession.getAttribute("questions");
		
		if((Integer)httpSession.getAttribute("qno")>0) {
			
			httpSession.setAttribute("qno",(Integer)httpSession.getAttribute("qno")-1);
			
			question = listofquestions.get((Integer)httpSession.getAttribute("qno"));
		}
		else
		{
			question = listofquestions.get(0);
			modelAndView.addObject("message","Questions Over.Click on next Button");
			
		}
		
		int qno = question.getQno();
		
		HashMap<Integer,Answer> hashMap = (HashMap<Integer,Answer>) httpSession.getAttribute("submittedDetails");
		
		Answer answer = hashMap.get(qno);
		
		String previousAnswer="";
		
		if(answer!=null) {
			previousAnswer = answer.getSubmittedAnswer();
		}
		
		modelAndView.addObject("question",question);
		modelAndView.addObject("previousAnswer",previousAnswer);
		
		modelAndView.setViewName("question");
		
		return modelAndView;
	}
	
	@RequestMapping("endexam")
	public ModelAndView endexam(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		
		HttpSession httpSession = request.getSession();
		
		HashMap<Integer, Answer> hashMap = (HashMap<Integer,Answer>)httpSession.getAttribute("submittedDetails");
		
		if(hashMap==null) {
			modelAndView.setViewName("login");
			return modelAndView;
		}
		
		Collection<Answer> collection = hashMap.values();
		
		for (Answer answer : collection) {
			if(answer.getOriginalAnswer().equals(answer.getSubmittedAnswer())) {
				httpSession.setAttribute("score",(Integer)httpSession.getAttribute("score") + 1);
			}
		}
		
		modelAndView.addObject("allanswer",collection);
		
		modelAndView.addObject("score",httpSession.getAttribute("score"));
		modelAndView.setViewName("score");
		
		httpSession.invalidate();
		
		return modelAndView;
	}
}
