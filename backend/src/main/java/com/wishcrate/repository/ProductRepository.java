package com.wishcrate.repository;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.wishcrate.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    
    Page<Product> findByActiveTrue(Pageable pageable);
    
    Page<Product> findByCategoryIdAndActiveTrue(Long categoryId, Pageable pageable);
    
    @Query("SELECT p FROM Product p WHERE p.active = true AND " +
           "(LOWER(p.name) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
           "LOWER(p.description) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
           "LOWER(p.brand) LIKE LOWER(CONCAT('%', :keyword, '%')))")
    Page<Product> searchProducts(@Param("keyword") String keyword, Pageable pageable);
    
    @Query("SELECT p FROM Product p WHERE p.active = true AND p.price BETWEEN :minPrice AND :maxPrice")
    Page<Product> findByPriceRange(@Param("minPrice") BigDecimal minPrice, 
                                   @Param("maxPrice") BigDecimal maxPrice, 
                                   Pageable pageable);
    
    List<Product> findByFeaturedTrueAndActiveTrue();
    
    Page<Product> findBySellerIdAndActiveTrue(Long sellerId, Pageable pageable);
    
    Page<Product> findByBrandAndActiveTrue(String brand, Pageable pageable);
    
    @Query("SELECT p FROM Product p WHERE p.active = true ORDER BY p.averageRating DESC")
    Page<Product> findTopRatedProducts(Pageable pageable);
    
    @Query(value = "SELECT p FROM Product p WHERE p.active = true ORDER BY p.averageRating DESC LIMIT :limit")
    List<Product> findTopRatedProducts(@Param("limit") int limit);
    
    @Query("SELECT p FROM Product p WHERE p.active = true AND " +
           "(:keyword IS NULL OR LOWER(p.name) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
           "LOWER(p.description) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
           "LOWER(p.brand) LIKE LOWER(CONCAT('%', :keyword, '%'))) AND " +
           "(:categoryId IS NULL OR p.category.id = :categoryId) AND " +
           "(:minPrice IS NULL OR p.price >= :minPrice) AND " +
           "(:maxPrice IS NULL OR p.price <= :maxPrice) AND " +
           "(:brand IS NULL OR LOWER(p.brand) = LOWER(:brand)) AND " +
           "(:minRating IS NULL OR p.averageRating >= :minRating) AND " +
           "(:discountOnly = false OR p.discountPrice IS NOT NULL)")
    Page<Product> filterProducts(@Param("keyword") String keyword,
                                 @Param("categoryId") Long categoryId,
                                 @Param("minPrice") BigDecimal minPrice,
                                 @Param("maxPrice") BigDecimal maxPrice,
                                 @Param("brand") String brand,
                                 @Param("minRating") Double minRating,
                                 @Param("discountOnly") boolean discountOnly,
                                 Pageable pageable);
    
    long countByActiveTrue();
}
