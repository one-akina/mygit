package com.stort.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.stort.bean.Commodit;
import com.stort.bean.Msg;
import com.stort.bean.User;
import com.stort.service.CommoditService;
import com.stort.service.UserService;

@Controller
public class MyTamllController {
	@Autowired
	CommoditService commoditService;
	@Autowired
	UserService userService;
	@ResponseBody
	@RequestMapping("/Ytamll")
	public ModelAndView Ytamll(String username,String password,String random,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		User user=new User();
		String randomCode=(String)session.getAttribute("randomCode");
		if(randomCode==null) {
			mv.setViewName("login");
			return mv;
		}
		if(random.equals(randomCode)) {
			user=userService.VerifyLogin(username,password);
			
			session.setAttribute("user", user);
		}
		if(user!=null) {
			mv.setViewName("mytamll");
			return mv;
		}else {
			mv.setViewName("error");
			return mv;
		}
	}	

	@RequestMapping("/Ntamll")
	public ModelAndView Ntamll() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("mytamll");
		return mv;
	}
	
	@RequestMapping("/admin")
	public ModelAndView myAdmin(Integer ID,String password,String random,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		User user=new User();
		String randomCode=(String)session.getAttribute("randomCode");
		if(randomCode==null) {
			mv.setViewName("login");
			return mv;
		}
		if(random.equals(randomCode)) {
			user=userService.VerifySeller(ID, password);
			
			session.setAttribute("user", user);
		}
		if(user!=null) {
			mv.setViewName("admin");
			return mv;
		}else {
			mv.setViewName("error");
			return mv;
		}
	}
	
	@ResponseBody
	@RequestMapping("/home")
	public Msg getHomeMods() {
		PageHelper.startPage(1, 12);
		List<Commodit> mods=commoditService.getAll();
		PageInfo pageInfo=new PageInfo(mods,5);
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	@RequestMapping("/commodit")
	public String getCommodit(RedirectAttributes model, @RequestParam("number")Integer number) {
		model.addFlashAttribute("number", number);
		return "commodit";
	}

	@RequestMapping("/shop")
	public String getMod(RedirectAttributes model, @RequestParam("shopnum")Integer shopnum) {
		model.addFlashAttribute("shopnum", shopnum);
		return "shop";
	}
	
	@RequestMapping("/login")
	public String DispathLogin() {
		return "login";
	}

	@RequestMapping("/register")
	public ModelAndView Register() {
		ModelAndView mv=new ModelAndView();
		
		return null;
		
	}
	@RequestMapping("/shopbus")
	public ModelAndView shopbus() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("shopbus");
		return mv;
	}
}
