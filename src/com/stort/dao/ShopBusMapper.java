package com.stort.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.stort.bean.Commodit;
import com.stort.bean.ShopBus;

public interface ShopBusMapper {
	List<ShopBus> selectByPrimaryKeyWithCommodit(Integer ID);
	
	int addCommodit(@Param("ID")Integer ID,@Param("number")Integer number,@Param("total")Integer total);
	
	String selectTotal(@Param("ID")Integer ID,@Param("number")Integer number);
	
	int updateCommodit(Integer ID, Integer number, Integer total);
	
	int delCommodit(Integer ID, Integer number);
}
