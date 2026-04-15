package com.wishcrate.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.wishcrate.dto.ProductDTO;
import com.wishcrate.model.Product;
import com.wishcrate.model.User;
import com.wishcrate.repository.ProductRepository;
import com.wishcrate.repository.UserRepository;

@Service
public class WishlistService {
    
    private final UserRepository userRepository;
    private final ProductRepository productRepository;
    
    public WishlistService(UserRepository userRepository, ProductRepository productRepository) {
        this.userRepository = userRepository;
        this.productRepository = productRepository;
    }
    
    private User getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String email = authentication.getName();
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found"));
    }
    
    public List<ProductDTO> getUserWishlist() {
        User user = getCurrentUser();
        return user.getWishlist().stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }
    
    public void addToWishlist(Long productId) {
        User user = getCurrentUser();
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found"));
        
        if (!user.getWishlist().contains(product)) {
            user.getWishlist().add(product);
            userRepository.save(user);
        }
    }
    
    public void removeFromWishlist(Long productId) {
        User user = getCurrentUser();
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found"));
        
        user.getWishlist().remove(product);
        userRepository.save(user);
    }
    
    public boolean isInWishlist(Long productId) {
        User user = getCurrentUser();
        return user.getWishlist().stream()
                .anyMatch(p -> p.getId().equals(productId));
    }
    
    private ProductDTO convertToDTO(Product product) {
        ProductDTO dto = new ProductDTO();
        dto.setId(product.getId());
        dto.setName(product.getName());
        dto.setDescription(product.getDescription());
        dto.setPrice(product.getPrice());
        dto.setDiscountPrice(product.getDiscountPrice());
        dto.setBrand(product.getBrand());
        dto.setImageUrl(!product.getImages().isEmpty() ? product.getImages().get(0) : null);
        dto.setStockQuantity(product.getStockQuantity());
        dto.setAverageRating(product.getAverageRating());
        dto.setTotalReviews(product.getTotalReviews());
        dto.setFeatured(product.isFeatured());
        dto.setSku(product.getSku());
        return dto;
    }
}
