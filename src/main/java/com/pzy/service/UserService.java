
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

import com.pzy.entity.User;
import com.pzy.repository.UserRepository;

@Service
public class UserService {
     @Autowired
     private UserRepository userRepository;
     
     public  User save(User user){
    	 return userRepository.save(user);
     }
     public User login(String userName,String password){
    	 List<User> users=userRepository.findByNameAndPassword(userName,password);
    	 return users.size()==0?null:users.get(0);
     }
     public Page<User> findAll(final int pageNumber, final int pageSize,final String name){
         PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
        
         Specification<User> spec = new Specification<User>() {
              public Predicate toPredicate(Root<User> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
              Predicate predicate = cb.conjunction();
              if (name != null) {
                   predicate.getExpressions().add(cb.like(root.get("name").as(String.class), name+"%"));
              }
              return predicate;
              }
         };
         Page<User> result = (Page<User>) userRepository.findAll(spec, pageRequest);
         return result;
     }
	public void delete(Long id){
	    userRepository.delete(id);
	}
	public User find(Long id){
		  return userRepository.findOne(id);
	}
}