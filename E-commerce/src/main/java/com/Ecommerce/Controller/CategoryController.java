package com.Ecommerce.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Ecommerce.Dao.categoryDao;
import com.Ecommerce.Dao.categoryDaoImpl;
import com.Ecommerce.Dao.userDaoImpl;
import com.Ecommerce.entity.Category;
import com.Ecommerce.entity.User;
@Controller                                                                                            
public class CategoryController {

	
	
	@Autowired
	private categoryDaoImpl categorydao;

	@RequestMapping(value = "/addCategory",method = RequestMethod.POST)
	public @ResponseBody String addCategory(HttpServletRequest request) {
	
		//String category_name= request.getParameter("category_name");
		
		Category category = new Category();
		category.setCategory_name(request.getParameter("category_name"));
		
		String messeage = categorydao.addCategory(category);
		 if(!messeage.equals("****"))
			 return"Error adding user";
			return messeage;
	}
}
