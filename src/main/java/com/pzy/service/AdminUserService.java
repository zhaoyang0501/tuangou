
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

import com.pzy.entity.AdminUser;
import com.pzy.repository.AdminUserRepository;

@Service
public class AdminUserService {
     @Autowired
     private AdminUserRepository adminUserRepository;
     
     public  AdminUser save(AdminUser adminUser){
    	 return adminUserRepository.save(adminUser);
     }
     public AdminUser login(String adminUserName,String password){
    	 List<AdminUser> adminUsers=adminUserRepository.findByNameAndPassword(adminUserName,password);
    	 return adminUsers.size()==0?null:adminUsers.get(0);
     }
     public Page<AdminUser> findAll(final int pageNumber, final int pageSize,final String name){
         PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
        
         Specification<AdminUser> spec = new Specification<AdminUser>() {
              public Predicate toPredicate(Root<AdminUser> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
              Predicate predicate = cb.conjunction();
              if (name != null) {
                   predicate.getExpressions().add(cb.like(root.get("name").as(String.class), name+"%"));
              }
              return predicate;
              }
         };
         Page<AdminUser> result = (Page<AdminUser>) adminUserRepository.findAll(spec, pageRequest);
         return result;
     }
	public void delete(Long id){
	    adminUserRepository.delete(id);
	}
	public AdminUser find(Long id){
		  return adminUserRepository.findOne(id);
	}
}