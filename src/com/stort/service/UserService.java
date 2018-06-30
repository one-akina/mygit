package com.stort.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stort.bean.User;
import com.stort.dao.UserMapper;

@Service
public class UserService {
	@Autowired
	UserMapper userMapper;

	public User VerifyLogin(String username,String password) {
		User user=new User();
		user=userMapper.LoginByUserName(username, password);
		if(user!=null) {
			return user;
		}else {
			return null;
		}			
	}
	public User VerifySeller(Integer ID,String password) {
		User user = new User();
		user =userMapper.LoginByID(ID, password);
		return user;
	}
	
}
