package com.wishcrate.dto;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ReviewDTO {
    private Long id;
    private String productName;
    private String userName;
    private Integer rating;
    private String comment;
    private List<String> images = new ArrayList<>();
    private boolean verified;
    private Integer helpfulCount;
    private LocalDateTime createdAt;
    
    public ReviewDTO() {}
    
    public ReviewDTO(Long id, String productName, String userName, Integer rating,
                     String comment, List<String> images, boolean verified,
                     Integer helpfulCount, LocalDateTime createdAt) {
        this.id = id;
        this.productName = productName;
        this.userName = userName;
        this.rating = rating;
        this.comment = comment;
        this.images = images;
        this.verified = verified;
        this.helpfulCount = helpfulCount;
        this.createdAt = createdAt;
    }
    
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getProductName() {
        return productName;
    }
    
    public void setProductName(String productName) {
        this.productName = productName;
    }
    
    public String getUserName() {
        return userName;
    }
    
    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    public Integer getRating() {
        return rating;
    }
    
    public void setRating(Integer rating) {
        this.rating = rating;
    }
    
    public String getComment() {
        return comment;
    }
    
    public void setComment(String comment) {
        this.comment = comment;
    }
    
    public List<String> getImages() {
        return images;
    }
    
    public void setImages(List<String> images) {
        this.images = images;
    }
    
    public boolean isVerified() {
        return verified;
    }
    
    public void setVerified(boolean verified) {
        this.verified = verified;
    }
    
    public Integer getHelpfulCount() {
        return helpfulCount;
    }
    
    public void setHelpfulCount(Integer helpfulCount) {
        this.helpfulCount = helpfulCount;
    }
    
    public LocalDateTime getCreatedAt() {
        return createdAt;
    }
    
    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
