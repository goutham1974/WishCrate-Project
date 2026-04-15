package com.wishcrate.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wishcrate.dto.ReviewDTO;
import com.wishcrate.model.Product;
import com.wishcrate.model.Review;
import com.wishcrate.model.User;
import com.wishcrate.repository.ProductRepository;
import com.wishcrate.repository.ReviewRepository;
import com.wishcrate.repository.UserRepository;

@Service
public class ReviewService {
    
    private final ReviewRepository reviewRepository;
    private final ProductRepository productRepository;
    private final UserRepository userRepository;
    
    public ReviewService(ReviewRepository reviewRepository, ProductRepository productRepository,
                        UserRepository userRepository) {
        this.reviewRepository = reviewRepository;
        this.productRepository = productRepository;
        this.userRepository = userRepository;
    }
    
    private User getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String email = authentication.getName();
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found"));
    }
    
    @Transactional
    public ReviewDTO createReview(Long productId, ReviewDTO reviewDTO) {
        User user = getCurrentUser();
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found"));
        
        Review review = new Review();
        review.setUser(user);
        review.setProduct(product);
        review.setRating(reviewDTO.getRating());
        review.setComment(reviewDTO.getComment());
        review.setImages(reviewDTO.getImages());
        
        // Mark as verified if user purchased this product
        review.setVerified(userRepository.hasUserPurchasedProduct(user.getId(), productId));
        
        Review savedReview = reviewRepository.save(review);
        
        // Update product rating
        updateProductRating(product);
        
        return convertToDTO(savedReview);
    }
    
    public Page<ReviewDTO> getProductReviews(Long productId, Pageable pageable) {
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found"));
        
        Page<Review> reviews = reviewRepository.findByProduct(product, pageable);
        return new PageImpl<>(
            reviews.getContent().stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList()),
            pageable,
            reviews.getTotalElements()
        );
    }
    
    public List<ReviewDTO> getUserReviews() {
        User user = getCurrentUser();
        return reviewRepository.findByUser(user).stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }
    
    public void markAsHelpful(Long reviewId) {
        Review review = reviewRepository.findById(reviewId)
                .orElseThrow(() -> new RuntimeException("Review not found"));
        review.setHelpfulCount((review.getHelpfulCount() != null ? review.getHelpfulCount() : 0) + 1);
        reviewRepository.save(review);
    }
    
    @Transactional
    public void deleteReview(Long reviewId) {
        Review review = reviewRepository.findById(reviewId)
                .orElseThrow(() -> new RuntimeException("Review not found"));
        
        User currentUser = getCurrentUser();
        if (!review.getUser().getId().equals(currentUser.getId())) {
            throw new RuntimeException("Unauthorized to delete this review");
        }
        
        Product product = review.getProduct();
        reviewRepository.delete(review);
        
        // Update product rating
        updateProductRating(product);
    }
    
    private void updateProductRating(Product product) {
        List<Review> reviews = product.getReviews();
        
        if (reviews.isEmpty()) {
            product.setAverageRating(0.0);
            product.setTotalReviews(0);
        } else {
            Double avgRating = reviews.stream()
                    .mapToDouble(Review::getRating)
                    .average()
                    .orElse(0.0);
            
            product.setAverageRating(Math.round(avgRating * 10.0) / 10.0);
            product.setTotalReviews(reviews.size());
        }
        
        productRepository.save(product);
    }
    
    private ReviewDTO convertToDTO(Review review) {
        return new ReviewDTO(
            review.getId(),
            review.getProduct().getName(),
            review.getUser().getFirstName() + " " + review.getUser().getLastName(),
            review.getRating(),
            review.getComment(),
            review.getImages(),
            review.isVerified(),
            review.getHelpfulCount(),
            review.getCreatedAt()
        );
    }
}
