package com.pzy.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.AdminUser;
public interface AdminUserRepository extends PagingAndSortingRepository<AdminUser, Long>,JpaSpecificationExecutor<AdminUser>{
	  public List<AdminUser> findByNameAndPassword(String userName,String password);
}

