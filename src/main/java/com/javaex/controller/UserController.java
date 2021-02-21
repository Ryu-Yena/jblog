package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.UserService;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value="/user")
public class UserController {
	
	//필드
	@Autowired
	private UserService userService;
	
	//생성자
	
	//g.s
	
	//회원가입 폼
	@RequestMapping(value="/joinForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String joinForm() {
		System.out.println("/user/joinForm");
		
		return "user/joinForm";
	}
	
	//회원가입 - 아이디체크
	@ResponseBody
	@RequestMapping(value="/idcheck", method = {RequestMethod.GET, RequestMethod.POST})
	public String idcheck(@RequestParam("id") String id ) {
		System.out.println("/user/idcheck");
		System.out.println("checkid = " + id);
		
		String result = userService.idcheck(id);
		
		System.out.println(result);
		
		return result;
	}
	
	//회원가입
	@RequestMapping(value="/join", method = {RequestMethod.GET, RequestMethod.POST})
	public String join(@ModelAttribute UserVo userVo) {
		System.out.println("/user/join");
		System.out.println(userVo.toString());
		
		int count = userService.join(userVo);
		
		return"user/joinSuccess";
	}

}
