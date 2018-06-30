package com.stort.dao;

import org.apache.ibatis.annotations.Param;

import com.stort.bean.User;

public interface UserMapper {
	User LoginByUserName(@Param("username")String username,@Param("password")String password);
	User LoginByID(@Param("ID")Integer ID,@Param("password")String password);
}
