package com.pzy.repository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Seller;
public interface SellerRepository extends PagingAndSortingRepository<Seller, Long>,JpaSpecificationExecutor<Seller>{
    
}

