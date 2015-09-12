
package com.pzy.service;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.pzy.entity.Order;
import com.pzy.entity.User;
import com.pzy.repository.OrderRepository;

@Service
public class OrderService {
	
    @Autowired
    private OrderRepository orderRepository;
    public List<Order> findAll() {
         return (List<Order>) orderRepository.findAll();
    }
    public List<Order> findOrderSubs() {
        return (List<Order>) orderRepository.findAll();
    }
    public List<Order> findOrders() {
        return (List<Order>) orderRepository.findAll();
    }
    public List<Order> findByUser(User user){
		return orderRepository.findByUser(user);
	}
    public Page<Order> findAll(final int pageNumber, final int pageSize,final String state){
        PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
       
        Specification<Order> spec = new Specification<Order>() {
             public Predicate toPredicate(Root<Order> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
             Predicate predicate = cb.conjunction();
             if (state != null) {
                  predicate.getExpressions().add(cb.equal(root.get("state").as(String.class), state));
             }
             return predicate;
             }
        };
        Page<Order> result = (Page<Order>) orderRepository.findAll(spec, pageRequest);
        return result;
    	}
		public void delete(Long id){
			orderRepository.delete(id);
		}
		public Order findOrder(Long id){
			  return orderRepository.findOne(id);
		}
		public Order find(Long id){
			  return orderRepository.findOne(id);
		}
		public void save(Order order){
			orderRepository.save(order);
		}
}