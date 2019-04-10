package com.cts.academy_portal.controller;

import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cts.academy_portal.bean.Faculty;
import com.cts.academy_portal.bean.Login;
import com.cts.academy_portal.bean.ReportManagement;
import com.cts.academy_portal.bean.SkillMaster;
import com.cts.academy_portal.bean.SkillSet;
import com.cts.academy_portal.service.AdminService;
import com.cts.academy_portal.service.FacultyService;
import com.cts.academy_portal.service.LoginService;


@Controller
public class FacultyController {
	
	@Autowired
	@Qualifier("sessionFactory")
	SessionFactory getSessionFactory;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private FacultyService facultyService;
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping(value="faculty/logout.html")
	public ModelAndView logout(HttpSession httpSession){
		ModelAndView modelAndView = new ModelAndView();
		Login login = (Login)httpSession.getAttribute("login_object");
		System.out.print("Retrieved Attribute Logout method"+login);
		String execeute= loginService.sessionClosed(login.getUserName());
		System.out.print(login);
		httpSession.invalidate();
		modelAndView.setViewName("redirect:/logout1.html");
		return modelAndView;
	}
	
	
	

	@RequestMapping("faculty/addFaculty.html")
	public String addFacultyPage(HttpSession httpSession){
		return "addFaculty";
	}
	
	@RequestMapping("faculty/insertFacultySkill.html")
	public String addskillPage(){
		return "insertFacultySkill";
	}
	
	/*@RequestMapping("faculty/home.html")
	public String getHome(HttpSession httpSession){
		httpSession.setAttribute("user",httpSession.getAttribute("login_object"));
		return "facultyHome";
	}*/
	
	@RequestMapping("faculty/reportManagement.html")
	public ModelAndView getReport(@ModelAttribute ReportManagement  reportManagement){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("batch",adminService.getAllBatch());
		modelAndView.addObject("faculty", adminService.getAllFaculty());
		modelAndView.setViewName("reportManagement");
		return modelAndView;
	}
	
	@PostMapping("faculty/addFaculty.html")
	public ModelAndView saveProduct(@ModelAttribute Faculty faculty,HttpSession httpSession ){
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("in mapping");
		System.out.println(faculty.getFacultyId());
		if(facultyService.insertFaculty(faculty)!=null){
			modelAndView.setViewName("done");
		}
		else{
			modelAndView.setViewName("fails");
		}
		return modelAndView;
	   }
	
	@PostMapping("faculty/reportManagement.html")
	public ModelAndView putReport(@ModelAttribute ReportManagement reportManagement){
	ModelAndView modelAndView = new ModelAndView();
	System.out.println(reportManagement.getBatchId());
	if(facultyService.insertReport(reportManagement)!=null){
		modelAndView.setViewName("done");
	}
	else{
		modelAndView.setViewName("fails");
	}
	return modelAndView;
}
	@PostMapping("faculty/insertSkill1.html")
	public ModelAndView saveSkill(@ModelAttribute SkillSet skillSet){
		ModelAndView modelAndView = new ModelAndView();
		if(facultyService.insertSkill(skillSet)!=null){
			modelAndView.setViewName("done");
		}
		else{
			modelAndView.setViewName("fails");
		}
		return modelAndView;
	}
}