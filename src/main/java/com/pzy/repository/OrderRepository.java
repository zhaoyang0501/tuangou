package com.pzy.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Order;
import com.pzy.entity.User;
public interface OrderRepository extends PagingAndSortingRepository<Order, Long>,JpaSpecificationExecutor<Order>{
	public List<Order> findByUser(User user);
}

