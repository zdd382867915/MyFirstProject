package com.bjsxt.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjsxt.domain.User;
import com.bjsxt.service.UserService;
import com.bjsxt.serviceImp.UserServiceImp;
import com.google.gson.Gson;

/**
 * Servlet implementation class UserServle
 */
public class UserServle extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//请求编码
		request.setCharacterEncoding("utf-8");
		//响应编码
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//获取请求信息
		String name=request.getParameter("name");
		System.out.println("用户请求的信息为:"+name);
		//处理请求信息
		UserService us=new UserServiceImp();
		User u=us.getUserInfoService(name);
		System.out.println("查询结果为："+u);
		//响应处理结果
		response.getWriter().write(new Gson().toJson(u));
		
	}

}
