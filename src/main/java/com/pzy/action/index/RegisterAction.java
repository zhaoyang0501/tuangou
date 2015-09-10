package com.pzy.action.index;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.pzy.entity.User;
import com.pzy.service.UserService;

@ParentPackage("struts-default")  
public class RegisterAction extends ActionSupport{
	private User user;
	private String tip;
	@Autowired
	UserService userService;
	@Action(value = "/registerUser", results = { @Result(name = "success", location = "/WEB-INF/views/login.jsp") })
	public String registerUser() throws Exception {
		userService.save(user);
		tip="注册成功，欢迎登陆！";
		return SUCCESS;
	}

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}
}
