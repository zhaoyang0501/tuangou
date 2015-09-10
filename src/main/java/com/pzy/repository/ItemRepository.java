package com.pzy.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Category;
import com.pzy.entity.Item;
import com.pzy.entity.User;
public interface ItemRepository extends PagingAndSortingRepository<Item, Long>,JpaSpecificationExecutor<Item>{
	public List<Item> findByUser(User user);
	public List<Item> findByCategory(Category category);
}

