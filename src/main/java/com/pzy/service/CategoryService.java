
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
import com.pzy.repository.CategoryRepository;

@Service
public class CategoryService {
	
    @Autowired
    private CategoryRepository categoryRepository;
    public List<Category> findAll() {
         return (List<Category>) categoryRepository.findAll();
    }
    public List<Category> findCategorySubs() {
        return (List<Category>) categoryRepository.findAll();
    }
    public List<Category> findCategorys() {
        return (List<Category>) categoryRepository.findAll();
    }
    
    public Page<Category> findAll(final int pageNumber, final int pageSize,final String name){
        PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
       
        Specification<Category> spec = new Specification<Category>() {
             public Predicate toPredicate(Root<Category> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
             Predicate predicate = cb.conjunction();
             if (name != null) {
                  predicate.getExpressions().add(cb.like(root.get("name").as(String.class), name+"%"));
             }
             return predicate;
             }
        };
        Page<Category> result = (Page<Category>) categoryRepository.findAll(spec, pageRequest);
        return result;
    	}
		public void delete(Long id){
			categoryRepository.delete(id);
		}
		public Category findCategory(Long id){
			  return categoryRepository.findOne(id);
		}
		public Category find(Long id){
			  return categoryRepository.findOne(id);
		}
		public void save(Category category){
			categoryRepository.save(category);
		}
}