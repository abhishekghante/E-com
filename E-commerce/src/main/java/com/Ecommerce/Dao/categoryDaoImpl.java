 package com.Ecommerce.Dao;

import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.Ecommerce.entity.Category;
import com.Ecommerce.entity.User;

public class categoryDaoImpl implements categoryDao {

	
	@Autowired
	DataSource datasource;
	
	private JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	


	public String addCategory(Category category) {
		
		try {
			String sql ="insert into category(category_name) values(?)";
			this.template.update(sql,category.getCategory_name());
				
			return"****";
			
		}catch(Exception e) {
			e.printStackTrace();
			return "Error ";
			
		}
		

	}

	@Override
	public List<Category> getAllCategories() {
		
		String sql="select * from category";
		return template.query(sql, (ResultSet rs, int rowNum) -> {
			Category  details = new Category();
			details.setCategory_id(rs.getInt("category_id"));
			details.setCategory_name(rs.getString("category_name"));
			return details;
		});
	}
}
