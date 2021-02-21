package com.javaex.service;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.BlogDao;
import com.javaex.dao.UserDao;
import com.javaex.vo.BlogVo;
import com.javaex.vo.UserVo;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private BlogDao blogDao;
	
	//회원가입- 아이디체크
	public String idcheck(String id) {
		System.out.println("[UserService.idcheck()]" + id);
		UserVo userVo = userDao.selectOne(id);
		String result = "";

		if (userVo == null) {
			// 사용할수있는 id
			result = "can";
		} else {
			// 사용할수없는 id
			result = "cant";
		}

		return result;
	}

	//회원가입
	public int join(UserVo userVo) {
		System.out.println("[UserService.join()]");
		
		
		String id = userVo.getId();
		String blogTitle = userVo.getUserName()+ "의 블로그 입니다.";
		
		
		BlogVo blogVo = new BlogVo(id, blogTitle);
		System.out.println(blogVo.toString());
		
		blogDao.insertBlog(blogVo);
		
		return userDao.insert(userVo);
	}
	
	//로그인
	public UserVo login(UserVo userVo) {
		System.out.println("[UserService.login()]");
		
		return userDao.selectUser(userVo);
	}

}
