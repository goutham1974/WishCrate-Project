package com.wishcrate.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.wishcrate.model.Product;
import com.wishcrate.model.Review;
import com.wishcrate.model.User;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {
    Page<Review> findByProductId(Long productId, Pageable pageable);
    Page<Review> findByUserId(Long userId, Pageable pageable);
    Page<Review> findByProduct(Product product, Pageable pageable);
    List<Review> findByUser(User user);
    boolean existsByProductIdAndUserId(Long productId, Long userId);
}
