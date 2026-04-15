package com.wishcrate.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.wishcrate.dto.ProductDTO;
import com.wishcrate.service.WishlistService;

@RestController
@RequestMapping("/api/wishlist")
public class WishlistController {
    
    private final WishlistService wishlistService;
    
    public WishlistController(WishlistService wishlistService) {
        this.wishlistService = wishlistService;
    }
    
    @GetMapping
    public ResponseEntity<List<ProductDTO>> getWishlist() {
        List<ProductDTO> wishlist = wishlistService.getUserWishlist();
        return ResponseEntity.ok(wishlist);
    }
    
    @PostMapping("/{productId}")
    public ResponseEntity<String> addToWishlist(@PathVariable Long productId) {
        wishlistService.addToWishlist(productId);
        return ResponseEntity.ok("Product added to wishlist");
    }
    
    @DeleteMapping("/{productId}")
    public ResponseEntity<String> removeFromWishlist(@PathVariable Long productId) {
        wishlistService.removeFromWishlist(productId);
        return ResponseEntity.ok("Product removed from wishlist");
    }
    
    @GetMapping("/check/{productId}")
    public ResponseEntity<Boolean> isInWishlist(@PathVariable Long productId) {
        boolean isInWishlist = wishlistService.isInWishlist(productId);
        return ResponseEntity.ok(isInWishlist);
    }
}
