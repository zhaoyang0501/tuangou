package com.pzy.web;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
@Scope("prototype")
@Component
public class CenterAction extends ActionSupport {

	/**
	 * 
	 */
	public String add() {
		System.out.println("fuckyou22 ");
		return SUCCESS;
	}

	private static final long serialVersionUID = 1L;
	public String execute() throws Exception {
		System.out.println("fuckyou ");
		return super.execute();
	}

}
