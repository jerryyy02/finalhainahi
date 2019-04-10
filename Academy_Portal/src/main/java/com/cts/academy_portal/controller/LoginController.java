package com.cts.academy_portal.controller;


import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import com.cts.academy_portal.bean.Login;
import com.cts.academy_portal.service.LoginService;



@Controller
public class LoginController {
	
	@Autowired
	@Qualifier("sessionFactory")
	SessionFactory getSessionFactory;
	
	@Autowired
	private LoginService loginService;
	

	@RequestMapping("login.html")
	public String getLoginPage(){
		return "login";
	}
	
	@RequestMapping(value="logout.html")
	public ModelAndView logout(HttpSession httpSession){
		ModelAndView modelAndView = new ModelAndView();
		Login login = (Login)httpSession.getAttribute("login_object");
		System.out.print("Retrieved Attribute Logout method"+login);
		//String execeute= loginService.sessionClosed(login.getUserName());
		System.out.print(login);
		httpSession.invalidate();
		modelAndView.setViewName("login");
		return modelAndView;
	}

	
	@PostMapping(value="login.html")
	public ModelAndView validateUser(@ModelAttribute Login login, HttpSession httpSession){
		ModelAndView modelAndView = new ModelAndView();
		httpSession.setAttribute("login_object", login);
		

		System.out.println(login);
		Login logi = (Login)httpSession.getAttribute("login_object");
System.out.println("Retrieved Attribute"+logi );
		if(loginService.authenticate(login.getUserName(), login.getPassword())!=null){
			Login login2 = loginService.authenticate(login.getUserName(), login.getPassword());
			/*if(login2.getUserStatus()==0){*/
				if(login2.getUserType().equals("Admin")){
					modelAndView.addObject("user", login2);
					String execute= loginService.sessionStarted(login.getUserName());
					modelAndView.setViewName("adminHome");
					}
					else if(login2.getUserType().equals("Faculty")){
						modelAndView.addObject("user", login2);
						String execeute= loginService.sessionStarted(login.getUserName());
						modelAndView.setViewName("facultyHome");		
						}	
			//}
			else if(login2.getUserStatus()==1){
				modelAndView.setViewName("alreadyLogedIn");
			}
			
	}	
		else{
			JOptionPane.showMessageDialog(null, "UserName and Password not matched");
			modelAndView.setViewName("login");
		}
		return modelAndView;
}	
}

