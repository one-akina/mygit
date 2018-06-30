package com.stort.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.stort.bean.Commodit;
import com.stort.bean.Msg;
import com.stort.bean.ShopBus;
import com.stort.bean.User;
import com.stort.service.CommoditService;
import com.stort.service.ShopBusService;


@Controller
public class CommoditController {
	@Autowired
	CommoditService commoditService;
	@Autowired
	ShopBusService shopBusService;
	@ResponseBody
	@RequestMapping("/shopview")
	public Msg ShopView(@RequestParam("shopnum") Integer shopnum) {
		PageHelper.startPage(1, 15);
		List<Commodit> mod = commoditService.getModByShopNum(shopnum);
		PageInfo pageInfo=new PageInfo(mod,5);
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	@ResponseBody
	@RequestMapping("/commoditview")
	public Msg CommoditView(@RequestParam("number") Integer number) {
		Commodit mod = commoditService.getMod(number);	
		return Msg.success().add("mod", mod);
	}
	@ResponseBody
	@RequestMapping("/addshopbus/{number}")
	public Msg AddShopBus(HttpSession session,@PathVariable("number")Integer number) {
		//找到当前用户的购物车，把商品添加进去
		User user=(User) session.getAttribute("user");
		Integer ID=user.getID();
		String totalStr=shopBusService.selectTotal(ID, number);
		if(totalStr!=null) {
			int total=Integer.parseInt(totalStr); 
			shopBusService.UpdateCommodit(ID, number,total+1);
		}else {
			shopBusService.AddCommodit(ID, number,1);
		}
		
		return Msg.success();
	}
	@ResponseBody
	@RequestMapping("/shopbusview")
	public Msg ShopBusView(HttpSession session) {
		User user=(User) session.getAttribute("user");
		Integer ID=user.getID();
		List<ShopBus> ShopBusInfo = shopBusService.getShopBusCommodit(ID);
		return Msg.success().add("ShopBusInfo", ShopBusInfo);
	}
	@ResponseBody
	@RequestMapping("/delshopbuscom/{number}")
	public Msg delShopBusCom(HttpSession session,@PathVariable("number")Integer number) {
		User user=(User) session.getAttribute("user");
		Integer ID=user.getID();
		shopBusService.delCommodit(ID, number);
		return Msg.success();
	}
	@RequestMapping("/search")
	public String serch(RedirectAttributes model,@RequestParam("searchtext")String searchtext) {
		model.addAttribute("searchText", searchtext);
		return "search";
	}
	@ResponseBody
	@RequestMapping("/searchview")
	public Msg SerchView(@RequestParam("searchText") String searchText) {
		PageHelper.startPage(1, 15);
		List<Commodit> mod = commoditService.getModBySerch(searchText);
		PageInfo pageInfo=new PageInfo(mod,5);
		return Msg.success().add("pageInfo", pageInfo);
	}
}
