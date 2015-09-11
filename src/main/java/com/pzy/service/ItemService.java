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

import com.pzy.entity.Category;
import com.pzy.entity.Item;
import com.pzy.entity.User;
import com.pzy.repository.ItemRepository;

@Service
public class ItemService {
	@Autowired
	private ItemRepository itemRepository;
	
	
	public Page<Item> findAll(final int pageNumber, final int pageSize,
			final String name) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize,
				new Sort(Direction.DESC, "id"));

		Specification<Item> spec = new Specification<Item>() {
			public Predicate toPredicate(Root<Item> root,
					CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (name != null) {
					predicate.getExpressions().add(
							cb.like(root.get("name").as(String.class),"%"+ name
									+ "%"));
				}
				return predicate;
			}
		};
		Page<Item> result = (Page<Item>) itemRepository.findAll(
				spec, pageRequest);
		return result;
	}

	public Item save(Item item) {
		return itemRepository.save(item);
	}
	public Item find(Long id) {
		return itemRepository.findOne(id);
	}

	public void delete(Long id) {
		Item item=this.itemRepository.findOne(id);
		itemRepository.delete(id);
	}

	public List<Item> findHot() {
		return itemRepository.findAll(
				new PageRequest(0, 6, new Sort(Direction.DESC, "count")))
				.getContent();
	}

	public List<Item> findNew() {
		return itemRepository.findAll(
				new PageRequest(0, 6, new Sort(Direction.DESC, "createDate")))
				.getContent();
	}
	public List<Item> findByCategory( Category category) {
		return itemRepository.findByCategory(category);
	}
}