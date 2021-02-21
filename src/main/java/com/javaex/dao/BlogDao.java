package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.BlogVo;

@Repository
public class BlogDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//블로그 생성
	public int insertBlog(BlogVo blogVo) {
		System.out.println("BlogDao.insertBlog");
		System.out.println(blogVo.toString());
		
		return sqlSession.insert("blog.insertBlog", blogVo);
	}
	
	//블로그 정보 가져오기
	public BlogVo selectBlog(String id) {
		System.out.println("BlogDao.selectBlog");
		
		return sqlSession.selectOne("blog.blogSelectOne", id);
	}
	
	//블로그 수정
	public void updateBlog(BlogVo blogVo) {
		System.out.println("[BlogDao.basicUpdate()]");
		
		System.out.println(blogVo);
		sqlSession.update("blog.basicUpdate", blogVo);
	}

}
