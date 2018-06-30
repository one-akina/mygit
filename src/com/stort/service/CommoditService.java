package com.stort.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stort.bean.Commodit;
import com.stort.bean.CommoditExample;
import com.stort.bean.CommoditExample.Criteria;
import com.stort.dao.CommoditMapper;

@Service
public class CommoditService {
	@Autowired
	CommoditMapper commoditMapper;

	public List<Commodit> getAll() {
		 
		return commoditMapper.selectByExample(null);
	}

	public Commodit getMod(Integer number) {
		// TODO Auto-generated method stub
		Commodit commodit=commoditMapper.selectByPrimaryKey(number);
		return commodit;
	}

	public void deleteBatch(List<Integer> del_ids) {
		// TODO Auto-generated method stub
		CommoditExample example=new CommoditExample();
		Criteria criteria=example.createCriteria();
		criteria.andNumberIn(del_ids);
		commoditMapper.deleteByExample(example);
	}

	public void deleteEmp(Integer id) {
		// TODO Auto-generated method stub
		commoditMapper.deleteByPrimaryKey(id);
	}

	public void saveMod(Commodit commodit) {
		// TODO Auto-generated method stub
		commoditMapper.insertSelective(commodit);
	}

	public void updateEmp(Commodit commodit) {
		// TODO Auto-generated method stub
		commoditMapper.updateByPrimaryKeySelective(commodit);
	}

	public List<Commodit> getModByShopNum(Integer shopnum) {
		// TODO Auto-generated method stub
		List<Commodit> modsByShopnum=commoditMapper.selectByShopNum(shopnum);
		return modsByShopnum;
	}
	
	public List<Commodit> getModBySerch(String serchText){
		List<Commodit> modsBySerch=commoditMapper.selectBySearch(serchText);
		return modsBySerch;
	}
}
