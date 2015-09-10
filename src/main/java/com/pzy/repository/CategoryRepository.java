package com.pzy.repository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Category;
public interface CategoryRepository extends PagingAndSortingRepository<Category, Long>,JpaSpecificationExecutor<Category>{
    
}

