package com.Ecommerce.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Ecommerce.Dao.categoryDaoImpl;
import com.Ecommerce.Dao.userDaoImpl;
import com.Ecommerce.entity.User;

@Controller
public class MainController {

	@Autowired
	private userDaoImpl userdao;
	
	@Autowired
	private categoryDaoImpl catdao;
	
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
	public String home(HttpSession session) {
		session.setAttribute("getAllCategory", catdao.getAllCategories());
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
