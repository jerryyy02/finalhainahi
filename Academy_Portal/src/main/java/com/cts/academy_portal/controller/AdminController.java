package com.cts.academy_portal.controller;

import javax.jws.WebParam.Mode; 
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import com.cts.academy_portal.bean.Batch;
import com.cts.academy_portal.bean.BatchAllocation;
import com.cts.academy_portal.bean.FacultyCredit;
import com.cts.academy_portal.bean.Login;
import com.cts.academy_portal.bean.Module;
import com.cts.academy_portal.bean.ReportManagement;
import com.cts.academy_portal.bean.SkillMaster;
import com.cts.academy_portal.service.AdminService;
import com.cts.academy_portal.service.LoginService;

@Controller
public class AdminController {

	
	@Autowired
	@Qualifier("sessionFactory")
	SessionFactory getSessionFactory;
	
	@Autowired
	private LoginService loginService;
	

	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="admin/logout.html")
	public ModelAndView logout(HttpSession httpSession){
		ModelAndView modelAndView = new ModelAndView();
		Login login = (Login)httpSession.getAttribute("login_object");
		System.out.print("Retrieved Attribute Logout method"+login);
		//String execeute= loginService.sessionClosed(login.getUserName());
		System.out.print(login);
		httpSession.invalidate();
		modelAndView.setViewName("redirect:/logout1.html");
		return modelAndView;
	}
	
	@GetMapping("logout1.html")
	public String log(){
		System.out.println("in get");
		return "login";
	}
	
	
	@RequestMapping("admin/registerUser.html")
	public String addFacultyPage(){
		return "registerUser";
	}
	
	@RequestMapping("admin/addModule.html")
	public String addModulePage(){
		return "addModule";
	}
	
	@RequestMapping("admin/insertSkill.html")
	public String addskillPage(){
		return "insertSkill";
	}
	
	/*@RequestMapping("admin/home.html")
	public String getHome(HttpSession httpSession){
		return "adminHome";
	}*/
	
	@RequestMapping("admin/batchAllocation.html")
	public ModelAndView batchAllocationPage(@ModelAttribute BatchAllocation batchAllocation){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("batch", adminService.getAllBatch());
		modelAndView.addObject("faculty", adminService.getAllFaculty());
		modelAndView.addObject("module", adminService.getAllModule());
		modelAndView.setViewName("batchAllocation");
		return modelAndView;
	}
	
	@RequestMapping("admin/updateBatch.html")
	public ModelAndView batchAllocationUpdatePage(@ModelAttribute BatchAllocation batchAllocation){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("batchModule", adminService.getAllBatchAllocation());
		modelAndView.setViewName("updateBatch");
		return modelAndView;
	}
	
	@RequestMapping("admin/generateReport.html")
	public ModelAndView generateReport(@ModelAttribute ReportManagement reportManagement){
		ModelAndView modelAndView =  new ModelAndView();
		System.out.println("In gr");

		modelAndView.addObject("batch", adminService.getAllBatchFromReference());
		modelAndView.setViewName("generateReport");
		return modelAndView;
	}
	
	@RequestMapping("admin/insertBatch.html")
	public String insertBatch(){
		return "insertBatch";
	}
	@RequestMapping("admin/generateReport1.html")
	public ModelAndView getViewBatch(@ModelAttribute ReportManagement reportManagement){
		ModelAndView modelAndView =  new ModelAndView();
		System.out.println("In gr1");
		modelAndView.addObject("batch", adminService.getAllBatchFromReference());
		modelAndView.setViewName("generateReport1");
		return modelAndView;
	}
	
	@RequestMapping("admin/viewReport.html")
	public ModelAndView viewReport(@ModelAttribute ReportManagement reportManagement){
		ModelAndView modelAndView = new ModelAndView();
		System.out.println(reportManagement.getBatchId());
		modelAndView.addObject("facultyCredit", adminService.getFacultyCredit(reportManagement.getBatchId()));
		modelAndView.setViewName("showReport");
		return modelAndView;
	}
	
	@PostMapping("admin/generateReport.html")
	public ModelAndView getReport(@ModelAttribute ReportManagement reportManagement ){
		ModelAndView modelAndView = new ModelAndView();
		reportManagement = adminService.getFeedback(reportManagement.getBatchId());
		int weeklyReport;
		int bhsReport;
		int mockTest;
		int innovationProject;
		int total;
		if(reportManagement.getWeeklyReport()==0){
			weeklyReport=0;
		}
		else if(reportManagement.getWeeklyReport()==1 || reportManagement.getWeeklyReport()==2){
			weeklyReport=5;
		}
		else if(reportManagement.getWeeklyReport()==3 || reportManagement.getWeeklyReport()==4){
			weeklyReport=10;
		}
		else {
			weeklyReport=0;
		}
		if("complete".equals(reportManagement.getBhsReport())){
			bhsReport=5;
		}
		else if("notComplete".equals(reportManagement.getBhsReport())){
			bhsReport=0;
		}
		else{
			bhsReport=0;
		}
		if(reportManagement.getMockTest()==0){
			mockTest=0;
		}
		else if(reportManagement.getMockTest()==1){
			mockTest=5;
		}
		else if(reportManagement.getMockTest()==2){
			mockTest=8;
		}
		else if(reportManagement.getMockTest()>3){
			mockTest=10;
		}
		else{
			mockTest=0;
		}
		if("notStarted".equals(reportManagement.getInnovationProject())){
			innovationProject=0;
		}
		else if("inComplete".equals(reportManagement.getInnovationProject())){
			innovationProject=2;
		}
		else if("complete".equals(reportManagement.getInnovationProject())){
			innovationProject=5;
		}
		else{
			innovationProject=0;
		}
		total= weeklyReport+bhsReport+mockTest+innovationProject;
		FacultyCredit facultyCredit = new FacultyCredit(reportManagement.getBatchId(), reportManagement.getFacultyId(), weeklyReport, bhsReport, mockTest, innovationProject,total);
		adminService.insertFacultyCredit(facultyCredit);
		System.out.println(bhsReport+" "+reportManagement.getBhsReport());
		modelAndView.addObject("facultyCredit", adminService.getFacultyCredit(reportManagement.getBatchId()));
		modelAndView.setViewName("showReport");
		return modelAndView;
	   }
	
	@PostMapping("admin/registerUser.html")
	public ModelAndView saveProduct(@ModelAttribute Login login ){
		ModelAndView modelAndView = new ModelAndView();
		if(loginService.insertUser(login)!=null){
			modelAndView.setViewName("done");
		}
		else{
			modelAndView.setViewName("fails");
		}
		return modelAndView;
	   }
	
	@PostMapping("admin/addModule.html")
	public ModelAndView saveProduct(@ModelAttribute Module module ){
		ModelAndView modelAndView = new ModelAndView();
		if(adminService.insertModule(module)!=null){
			modelAndView.setViewName("done");
		}
		else{
			modelAndView.setViewName("fails");
		}
		return modelAndView;
	   }
	
	@PostMapping("admin/batchAllocation.html")
	public ModelAndView saveBatchAllocation(@ModelAttribute BatchAllocation batchAllocation ){
		ModelAndView modelAndView = new ModelAndView();
		if(adminService.insertBatchAllocation(batchAllocation)!=null){
			modelAndView.setViewName("done");
		}
		else{
			modelAndView.setViewName("fails");
		}
		return modelAndView;
	   }
	
	@PostMapping("admin/insertBatch.html")
	public ModelAndView saveBatch(@ModelAttribute Batch batch){
		ModelAndView modelAndView = new ModelAndView();
		if(adminService.insertBatch(batch)!=null){
			modelAndView.setViewName("done");
		}
		else{
			modelAndView.setViewName("fails");
		}
		return modelAndView;
	}
	
	@PostMapping("admin/insertSkill.html")
	public ModelAndView saveSkill(@ModelAttribute SkillMaster skillMaster){
		ModelAndView modelAndView = new ModelAndView();
		if(adminService.insertSkill(skillMaster)!=null){
			modelAndView.setViewName("done");
		}
		else{
			modelAndView.setViewName("fails");
		}
		return modelAndView;
	}
	
	@PostMapping("admin/updateBatch.html")
	public ModelAndView updateBatchAllocation(@ModelAttribute BatchAllocation batchAllocation ){
		ModelAndView modelAndView = new ModelAndView();
		System.out.println(batchAllocation.getBatchAllocationId());
		System.out.println(batchAllocation);
		if(adminService.updateBatchAllocation(batchAllocation.getBatchAllocationId(), batchAllocation.getCloseDate())!=null){
			modelAndView.setViewName("done");
		}
		else{
			modelAndView.setViewName("fails");
		}
		return modelAndView;
	   }

}
