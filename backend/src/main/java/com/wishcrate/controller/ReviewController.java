package com.wishcrate.controller;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wishcrate.dto.ReviewDTO;
import com.wishcrate.service.ReviewService;

@RestController
@RequestMapping("/api/reviews")
public class ReviewController {
    
    private final ReviewService reviewService;
    
    public ReviewController(ReviewService reviewService) {
        this.reviewService = reviewService;
    }
    
    @PostMapping("/{productId}")
    public ResponseEntity<ReviewDTO> createReview(
            @PathVariable Long productId,
            @RequestBody ReviewDTO reviewDTO) {
        ReviewDTO createdReview = reviewService.createReview(productId, reviewDTO);
        return ResponseEntity.ok(createdReview);
    }
    
    @GetMapping("/product/{productId}")
    public ResponseEntity<Page<ReviewDTO>> getProductReviews(
            @PathVariable Long productId,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size) {
        
        Pageable pageable = PageRequest.of(page, size);
        Page<ReviewDTO> reviews = reviewService.getProductReviews(productId, pageable);
        return ResponseEntity.ok(reviews);
    }
    
    @GetMapping("/my-reviews")
    public ResponseEntity<List<ReviewDTO>> getUserReviews() {
        List<ReviewDTO> reviews = reviewService.getUserReviews();
        return ResponseEntity.ok(reviews);
    }
    
    @PostMapping("/{reviewId}/helpful")
    public ResponseEntity<String> markAsHelpful(@PathVariable Long reviewId) {
        reviewService.markAsHelpful(reviewId);
        return ResponseEntity.ok("Review marked as helpful");
    }
    
    @DeleteMapping("/{reviewId}")
    public ResponseEntity<String> deleteReview(@PathVariable Long reviewId) {
        reviewService.deleteReview(reviewId);
        return ResponseEntity.ok("Review deleted successfully");
    }
}
