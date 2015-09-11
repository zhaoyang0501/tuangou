package com.pzy.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "t_adminuser")
public class AdminUser {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String name;
	private String password;
	private String remark;
	private String role1;
	private String role2;
	private String role3;
	private String role4;
	private String role5;
	private String role6;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getRole1() {
		return role1;
	}
	public void setRole1(String role1) {
		this.role1 = role1;
	}
	public String getRole2() {
		return role2;
	}
	public void setRole2(String role2) {
		this.role2 = role2;
	}
	public String getRole3() {
		return role3;
	}
	public void setRole3(String role3) {
		this.role3 = role3;
	}
	public String getRole4() {
		return role4;
	}
	public void setRole4(String role4) {
		this.role4 = role4;
	}
	public String getRole5() {
		return role5;
	}
	public void setRole5(String role5) {
		this.role5 = role5;
	}
	public String getRole6() {
		return role6;
	}
	public void setRole6(String role6) {
		this.role6 = role6;
	}
	
}
