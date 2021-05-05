package com.Ecommerce.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Ecommerce.Dao.userDaoImpl;
import com.Ecommerce.entity.User;

public class UserController {

	@Autowired
	private userDaoImpl userdao;
	
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
	

	
}
