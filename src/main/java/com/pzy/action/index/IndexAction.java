package com.pzy.action.index;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.pzy.entity.Category;
import com.pzy.service.CategoryService;
import com.pzy.service.ItemService;

@ParentPackage("struts-default")  
@Namespace("/")
public class IndexAction extends ActionSupport{
	
	private List<Category> categorys;
	@Autowired
	ItemService itemService;
	@Autowired
	CategoryService categoryService;
	public String execute() throws Exception {
		/*cookBookNews=cookBookService.findNew();
		cookBookHots=cookBookService.findHot();*/
		categorys=categoryService.findCategorys();
		return SUCCESS;
	}
	@Action(value = "gocategory", results = { @Result(name = "success", location = "/WEB-INF/views/category.jsp") })
	public String gocategory() throws Exception {
		categorys=categoryService.findCategorys();
		return SUCCESS;
	}
	public List<Category> getCategorys() {
		return categorys;
	}
	public void setCategorys(List<Category> categorys) {
		this.categorys = categorys;
	}
}
