package com.stort.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stort.bean.Commodit;
import com.stort.bean.ShopBus;
import com.stort.dao.ShopBusMapper;

@Service
public class ShopBusService {
	@Autowired
	ShopBusMapper shopBusMapper;
	
	public List<ShopBus> getShopBusCommodit(Integer ID){
		List<ShopBus> list=shopBusMapper.selectByPrimaryKeyWithCommodit(ID);
		return list;
	};
	
	public void AddCommodit(Integer ID,Integer number,Integer total) {
		shopBusMapper.addCommodit(ID, number, total);
	}
	
	public String selectTotal(Integer ID,Integer number) {
		String totalStr=shopBusMapper.selectTotal(ID, number);
		return totalStr;
	}

	public void UpdateCommodit(Integer ID, Integer number, Integer total) {
		// TODO Auto-generated method stub
		
		shopBusMapper.updateCommodit(ID,number,total);
	}
	
	public void delCommodit(Integer ID, Integer number) {
		shopBusMapper.delCommodit(ID, number);
	}
}
