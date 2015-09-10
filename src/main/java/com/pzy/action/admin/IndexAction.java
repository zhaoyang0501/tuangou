package com.pzy.action.admin;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/admin")
public class IndexAction  extends ActionSupport{
	private String userName;
	private String  password;
	private String tip;
    

	public void setPassword(String password) {
		this.password = password;
	}
	@Action(value = "/adminindex", results = { @Result(name = "success", location = "/WEB-INF/views/admin/index.jsp") })
     public String index(){
          return SUCCESS;
     }
     @Action(value = "login", results = { @Result(name = "success", location = "/WEB-INF/views/admin/login.jsp") })
     public String login(){
          return SUCCESS;
     }
     @Action(value = "loginout", results = { @Result(name = "success", location = "/WEB-INF/views/admin/login.jsp") })
     public String loginout(){
    	 	ActionContext.getContext().getSession().remove("adminuser");
    	 	ActionContext.getContext().getSession().clear();
    	 	return SUCCESS;
     }
     @Action(value = "gologin", results = { @Result(name = "success", location = "/WEB-INF/views/admin/index.jsp"),@Result(name = "input", location = "/WEB-INF/views/admin/login.jsp") })
     public String gologin(){
    	 if("admin".equals(this.userName)&&"123456".equals(this.password)){
    		 ActionContext.getContext().getSession().put("adminuser", "admin");
    		 return SUCCESS;
    	 }
    			
    	 else{
    		 tip="登录失败，用户名或者密码不正确";
    		 return INPUT;
    	 } 
         
     }
 	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
    public String getUserName() {
 		return userName;
 	}
 	public void setUserName(String userName) {
 		this.userName = userName;
 	}
 	public String getPassword() {
 		return password;
 	}
}

