package com.Ecommerce.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Ecommerce.Dao.userDaoImpl;
import com.Ecommerce.entity.User;

@Controller
public class MainController {

	@Autowired
	private userDaoImpl userdao;
	
	@RequestMapping(value = "/",method = RequestMethod.GET)
	public String signup() {
	
		return "common/Signup";
	}
	
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public String login() {
	
		return "common/login";
	}
	
	@RequestMapping(value = "/forgotpass",method = RequestMethod.GET)
	public String forgotpass() {
	
		return "common/forgotpass";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home() {

		return "common/index";
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin() {

		return "common/admin";
	}
	
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String addProduct() {

		return "common/addProduct";
	}
	
	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public String addCategory() {

		return "common/category";
	}
	
	
	
	
	@RequestMapping(value = "/addUser",method = RequestMethod.POST)
	public @ResponseBody String addUser(HttpServletRequest request) {
	
		String username= request.getParameter("username");
		String password= request.getParameter("password");
		String email= request.getParameter("email");
		String Mobnumber= request.getParameter("Mobnumber");
		String address= request.getParameter("address");
		
		User userDetail=new User();	
		
		userDetail.setUser_name(username);
		userDetail.setUser_password(password);
		userDetail.setUser_email(email);
		userDetail.setMobile(Mobnumber);
		userDetail.setUser_address(address);
		String messeage = userdao.addUser(userDetail);
		 if(!messeage.equals("****"))
		  return"Error adding user";
		return messeage;
	}
	
	
	@RequestMapping(value = "/loginValidation",method = RequestMethod.POST)
	public @ResponseBody String loginValidation(HttpServletRequest request) {
	
		String username= request.getParameter("username");
		String password= request.getParameter("password");

		User user = userdao.loginCheck(username, password);
		
	    if(user==null)
	    	return "Invalid user";
		 
		return "****";
	}
	
	
	
	
	
	
	// useraddCode
}
