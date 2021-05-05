package com.Ecommerce.Dao;

import java.util.List;

import com.Ecommerce.entity.Category;
import com.Ecommerce.entity.User;

public interface categoryDao {

	String addCategory(Category category);
	List<Category> getAllCategories();
}
