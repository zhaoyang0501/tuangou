package com.pzy.action.admin;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;

import com.opensymphony.xwork2.ActionSupport;
import com.pzy.entity.Item;
import com.pzy.entity.Order;
import com.pzy.service.ItemService;
import com.pzy.service.OrderService;
/***
 * 订单管理
 * http://127.0.0.1:8080/tuangou/admin/order/index
 *
 */
@Namespace("/admin/order")
@ParentPackage("json-default")
public class OrderAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private Integer sEcho = 1;
	private Integer iDisplayStart = 0;
	private Integer iDisplayLength = 10;
	private Map<String, Object> resultMap = new HashMap<String, Object>();

	private String name;
	private Long id;
	private Order order;
	private List<Order> orders;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ItemService  itemService;

	@Action(value = "index", results = { @Result(name = "success", location = "/WEB-INF/views/admin/order/index.jsp") })
	public String index() {
		orders = orderService.findOrders();
		return SUCCESS;
	}

	@Action(value = "list", results = { @Result(name = "success", type = "json") }, params = {
			"contentType", "text/html" })
	public String list() {
		int pageNumber = (int) (iDisplayStart / iDisplayLength) + 1;
		int pageSize = iDisplayLength;
		Page<Order> list = orderService.findAll(pageNumber, pageSize, name);
		resultMap.put("aaData", list.getContent());
		resultMap.put("iTotalRecords", list.getTotalElements());
		resultMap.put("iTotalDisplayRecords", list.getTotalElements());
		resultMap.put("sEcho", sEcho);
		return SUCCESS;
	}
	/***
	 * 点击发货按钮
	 * @return
	 */
	@Action(value = "approveOk", results = { @Result(name = "success", type = "json") }, params = {
			"contentType", "text/html" })
	public String approveOk() {
		Order order = orderService.find(id);
		order.setState("已发货");
		orderService.save(order);
		resultMap.put("state", "success");
		resultMap.put("msg", "发货成功");
		return SUCCESS;
	}
	/***
	 * 点击审核退回
	 * @return
	 */
	@Action(value = "approveNotOk", results = { @Result(name = "success", type = "json") }, params = {
			"contentType", "text/html" })
	public String approveNotOk() {
		Order order = orderService.find(id);
		order.setState("审核不通过");
		Item item=order.getItem();
		item.setCount(item.getCount()+1);
		itemService.save(item);
		orderService.save(order);
		resultMap.put("state", "success");
		resultMap.put("msg", "退回成功");
		return SUCCESS;
	}

	@Action(value = "delete", results = { @Result(name = "success", type = "json") }, params = {
			"contentType", "text/html" })
	public String delete() {
		orderService.delete(id);
		resultMap.put("state", "success");
		resultMap.put("msg", "删除成功");
		return SUCCESS;
	}

	@Action(value = "get", results = { @Result(name = "success", type = "json") }, params = {
			"contentType", "text/html" })
	public String get() {
		resultMap.put("orderSub", orderService.find(id));
		resultMap.put("state", "success");
		resultMap.put("msg", "删除成功");
		return SUCCESS;
	}

	@Action(value = "update", results = { @Result(name = "success", type = "json") }, params = {
			"contentType", "text/html" })
	public String update() {
		Order bean = orderService.find(order.getId());

		orderService.save(bean);
		resultMap.put("state", "success");
		resultMap.put("msg", "修改成功");
		return SUCCESS;
	}

	@Action(value = "save", results = { @Result(name = "success", type = "json") }, params = {
			"contentType", "text/html" })
	public String save() {
		order.setCreateDate(new Date(System.currentTimeMillis()));
		orderService.save(order);
		resultMap.put("state", "success");
		resultMap.put("msg", "保存成功");
		return SUCCESS;
	}

	/* ~~~~~~~~get and setter~~~~~~~~~ */
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

	public void setName(String name) {
		this.name = name;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}
}
