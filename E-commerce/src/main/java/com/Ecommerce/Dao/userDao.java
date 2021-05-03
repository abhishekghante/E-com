package com.Ecommerce.Dao;

import com.Ecommerce.entity.User;

public interface userDao {
	
	String addUser(User user);
	User loginCheck(String username,String password);

}
