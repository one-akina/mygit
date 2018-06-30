package com.stort.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.stort.bean.Commodit;
import com.stort.bean.Msg;
import com.stort.bean.User;
import com.stort.service.CommoditService;


@Controller
public class AdminController {
	@Autowired
	CommoditService commoditService;
	
	@RequestMapping("/mods")
	@ResponseBody
	public Msg getmodsWithJson(@RequestParam(value="pageNum",defaultValue="1")Integer PageNum,HttpSession session) {
		User user=(User)session.getAttribute("user");
		Integer shopnum = user.getID();
		//引入PageHelper分页插件
				//查询之前调用，传入页码和每页的大小
				PageHelper.startPage(PageNum, 5);
				List<Commodit> mods=commoditService.getModByShopNum(shopnum);
				//使用PageInfo包装查询后的结果,只需要将PageInfo交给页面,显示5页页数
				
				PageInfo pageInfo=new PageInfo(mods,5);
		
		return Msg.success().add("pageInfo", pageInfo);
		
	}
	@RequestMapping("/mod/{id}")
	@ResponseBody
	public Msg getModWithJson(@PathVariable("id")Integer number) {
		
		Commodit commodit=commoditService.getMod(number);
		return Msg.success().add("mod", commodit);
	}
	@RequestMapping("/del/{numbers}")
	@ResponseBody
	public Msg delMod(@PathVariable("numbers")String numbers) {
		if(numbers.contains("-")) {
			List<Integer> del_ids=new ArrayList<>();
			String[] str_ids=numbers.split("-");
			for(String id:str_ids) {
				del_ids.add(Integer.parseInt(id));
			}
			commoditService.deleteBatch(del_ids);
			
		}else {
			Integer id=Integer.parseInt(numbers);
			commoditService.deleteEmp(id);			
		}
		return Msg.success();
	}
	
	
	@RequestMapping(value="/update/{number}",method=RequestMethod.PUT)
	@ResponseBody
	public Msg savaUpdata(HttpServletRequest request,@RequestParam("name")String name, @PathVariable("number")Integer number,@RequestParam("price")Double price,
			@RequestParam("intro")String intro,@RequestParam("year")String year,@RequestParam("month")String month,
			@RequestParam("day")String day,@RequestParam("photo")MultipartFile file,HttpSession session) throws IOException {
		String date=year+month+day;
		Commodit commodit=new Commodit();
		commodit.setDate(date);
		commodit.setIntro(intro);
		commodit.setPrice(price);
		commodit.setName(name);
		commodit.setNumber(number);
		User user=(User) session.getAttribute("user");
		Integer shopnum=user.getID();
		commodit.setShopnum(shopnum);
		//使用UUID重命名图片 避免重复
		String photoname = UUID.randomUUID().toString().replaceAll("-", "");
		//截取文件后缀名
		String ext = FilenameUtils.getExtension(file.getOriginalFilename());
		//获取文件上传路径
		 String url = request.getSession().getServletContext().getRealPath("/images");
		 file.transferTo(new File(url+"/"+photoname+"."+ext));
		commodit.setPhoto(photoname + "." + ext);
		commoditService.updateEmp(commodit);
		return Msg.success();		
	}
	
	@RequestMapping(value="/addCom",method=RequestMethod.POST)
	@ResponseBody
	public Msg addCom(HttpServletRequest request,@RequestParam("name")String name,@RequestParam("price")Double price,
			@RequestParam(value="intro",required=false)String intro,@RequestParam("year")String year,@RequestParam("month")String month,
			@RequestParam("day")String day,@RequestParam("photo")MultipartFile file,HttpSession session) throws IOException {
		String date=year+month+day;
		Commodit commodit=new Commodit();
		commodit.setDate(date);
		commodit.setIntro(intro);
		commodit.setPrice(price);
		commodit.setName(name);
		User user=(User) session.getAttribute("user");
		Integer shopnum=user.getID();
		commodit.setShopnum(shopnum);	
		//使用UUID重命名图片 避免重复
				String photoname = UUID.randomUUID().toString().replaceAll("-", "");
				//截取文件后缀名
				String ext = FilenameUtils.getExtension(file.getOriginalFilename());
				//获取文件上传路径
				 String url = request.getSession().getServletContext().getRealPath("/images");
				 file.transferTo(new File(url+"/"+photoname+"."+ext));
				commodit.setPhoto(photoname + "." + ext);
		commoditService.saveMod(commodit);
		return Msg.success();
	}
	
}
