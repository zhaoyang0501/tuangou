package com.pzy.action.admin;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;

import com.opensymphony.xwork2.ActionSupport;
import com.pzy.entity.Category;
import com.pzy.entity.Item;
import com.pzy.service.CategoryService;
import com.pzy.service.ItemService;

@Namespace("/admin/item")
@ParentPackage("json-default")  
public class ItemAction  extends ActionSupport{
     private Integer sEcho=1;
     private Integer iDisplayStart=0;
     private Integer iDisplayLength=10;
     private String name;
     private Long id;
     private Item item;
     private File imgPath;  
 	 private String imgPathContentType;  
	private String imgPathFileName;  
	  private List<Category> categorys;
	  private String tip;
	private Map<String,Object> resultMap= new HashMap<String,Object>();
     @Autowired
     private ItemService itemService;
     @Autowired
     private CategoryService categoryService;
     @Action(value = "index", results = { @Result(name = "success", location = "/WEB-INF/views/admin/item/index.jsp") }) 
     public String index(){
    	  categorys=categoryService.findCategorys();
          return SUCCESS;
     }
    
     
    @Action(value = "list", results = { @Result(name = "success", type = "json") }, params = { "contentType", "text/html" })  
     public String list(){
         int pageNumber = (int) (iDisplayStart / iDisplayLength) + 1;
          int pageSize = iDisplayLength;
          Page<Item> list = itemService.findAll(pageNumber, pageSize, name);
          resultMap.put("aaData", list.getContent());
          resultMap.put("iTotalRecords", list.getTotalElements());
          resultMap.put("iTotalDisplayRecords", list.getTotalElements());
          resultMap.put("sEcho", sEcho);
          return SUCCESS;
     }
     
    
    @Action(value = "save", results = { @Result(name = "success", location = "/WEB-INF/views/admin/item/index.jsp") })
	public String save() throws Exception {
    	item.setCreateDate(new Date(System.currentTimeMillis()));
		item.setImgPath(this.imgPathFileName);
		itemService.save(item);
		/**文件上传逻辑*/
		String realpath = ServletActionContext.getServletContext().getRealPath("/upload");
		System.out.println(realpath);
		File saveImg = new File(new File(realpath), this.imgPathFileName);
         try {
			FileUtils.copyFile(imgPath, saveImg);
		} catch (IOException e) {
			e.printStackTrace();
			return ERROR;
		}
         tip="新增商品成功";
       return SUCCESS;
	}
    
    @Action(value = "delete", results = { @Result(name = "success", type = "json") }, params = { "contentType", "text/html" })  
        public String delete(){
         try {
        	 itemService.delete(id);
			 resultMap.put("state", "success");
	         resultMap.put("msg", "删除成功");
		} catch (Exception e) {
			 resultMap.put("state", "error");
	         resultMap.put("msg", "删除失败，外键约束");
		}
         
             return SUCCESS;
        }
    @Action(value = "get", results = { @Result(name = "success", type = "json") }, params = { "contentType", "text/html" })  
    public String get(){
     resultMap.put("object", itemService.find(id));
     resultMap.put("state", "success");
     resultMap.put("msg", "成功");
         return SUCCESS;
    }
    
    @Action(value = "update", results = { @Result(name = "success", type = "json") }, params = { "contentType", "text/html" })  
    public String update(){
    Item itemToupdate= itemService.find(item.getId());
    itemToupdate.setCategory(item.getCategory());
    itemToupdate.setCount(item.getCount());
    itemToupdate.setName(item.getName());
    itemToupdate.setRemark(item.getRemark());
    itemToupdate.setScore(item.getScore());
    itemService.save(itemToupdate);
     resultMap.put("state", "success");
     resultMap.put("msg", "修改成功");
     return SUCCESS;
    }
     /*~~~~~~~~get and setter~~~~~~~~~*/
	@JSON
	public Map<String, Object> getResultMap() {
		return resultMap;
	}

	public void setResultMap(Map<String, Object> resultMap) {
		this.resultMap = resultMap;
	}

	public Integer getSEcho() {
		return sEcho;
	}

	public void setSEcho(Integer sEcho) {
		this.sEcho = sEcho;
	}

	public Integer getIDisplayStart() {
		return iDisplayStart;
	}

	public void setIDisplayStart(Integer idisplayStart) {
		this.iDisplayStart = idisplayStart;
	}

	public Integer getIDisplayLength() {
		return iDisplayLength;
	}

	public void setIDisplayLength(Integer iDisplayLength) {
		this.iDisplayLength = iDisplayLength;
	}

	public String getName() {
		return name;
	}

	public void setName(String userName) {
		this.name = userName;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public List<Category> getCategorys() {
		return categorys;
	}

	public void setCategorys(List<Category> categorys) {
		this.categorys = categorys;
	}

	public List<Category> getCategorySubs() {
		return categorys;
	}

	public void setCategorySubs(List<Category> categorySubs) {
		this.categorys = categorySubs;
	}

	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}

	public File getImgPath() {
		return imgPath;
	}

	public void setImgPath(File imgPath) {
		this.imgPath = imgPath;
	}

	public String getImgPathContentType() {
		return imgPathContentType;
	}

	public void setImgPathContentType(String imgPathContentType) {
		this.imgPathContentType = imgPathContentType;
	}

	public String getImgPathFileName() {
		return imgPathFileName;
	}

	public void setImgPathFileName(String imgPathFileName) {
		this.imgPathFileName = imgPathFileName;
	}

}
