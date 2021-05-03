package com.Ecommerce.Dao;

import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.Ecommerce.entity.User;

public class userDaoImpl implements userDao {

	@Autowired
	DataSource datasource;
	
	private JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	



	public String addUser(User user) {
		
		try {
			String sql ="insert into user(user_name,user_password,user_email,user_address,mobile) values(?,?,?,?,?)";
			this.template.update(sql,user.getUser_name(),user.getUser_password(),user.getUser_email(),user.getUser_address()
					,user.getMobile());
			return"****";
			
		}catch(Exception e) {
			e.printStackTrace();
			return "Error Registration please contact administrator";
			
		}
		

	}

	
	//new Object[] { username, password }

	public User loginCheck(String username, String password) {

		String sql = "select * from user where user_name = ? and user_password = ?";
		
		List<User> userDetails = this.template.query(sql,
				new Object[] { username, password }, (ResultSet rs, int arg1) -> {
					User user = new User();
					user.setUser_id(rs.getInt("user_id"));
					user.setUser_name(rs.getString("user_name"));
					user.setUser_password(rs.getString("user_password"));
					return user;
				});
		return userDetails.size() > 0 ?  userDetails.get(0) : null ;
				
}
}