package com.wishcrate.config;

import java.util.List;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import com.wishcrate.model.Product;
import com.wishcrate.repository.ProductRepository;

/**
 * Initializes image URLs for all products that have null imageUrl.
 * This ensures all products are displayable with proper placeholder images.
 */
@Component
public class ImageUrlInitializer implements CommandLineRunner {
    
    private final ProductRepository productRepository;
    
    public ImageUrlInitializer(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }
    
    @Override
    public void run(String... args) throws Exception {
        // Get all products with null imageUrl
        List<Product> productsWithoutImages = productRepository.findAll()
                .stream()
                .filter(p -> p.getImageUrl() == null || p.getImageUrl().isEmpty())
                .toList();
        
        if (!productsWithoutImages.isEmpty()) {
            productsWithoutImages.forEach(product -> {
                // Generate a unique color and text for the placeholder based on product name
                String cleanName = product.getName()
                        .replaceAll("[^a-zA-Z0-9\\s]", "")
                        .replace(" ", "+")
                        .substring(0, Math.min(20, product.getName().length()));
                
                // Create color based on category
                String color = generateColorForCategory(product.getCategory() != null ? 
                        product.getCategory().getId() : 1);
                
                // Set imageUrl with placehold.co service
                String imageUrl = String.format(
                        "https://placehold.co/400x400/%s/ffffff?text=%s",
                        color, cleanName
                );
                product.setImageUrl(imageUrl);
            });
            
            // Save all updated products
            productRepository.saveAll(productsWithoutImages);
            System.out.println("✓ Initialized image URLs for " + productsWithoutImages.size() + " products");
        } else {
            System.out.println("✓ All products already have image URLs");
        }
    }
    
    /**
     * Generate a color hex code based on category ID for visual variety.
     */
    private String generateColorForCategory(Long categoryId) {
        return switch (Math.toIntExact(categoryId % 6)) {
            case 0 -> "1f1f1f";  // Dark gray for Electronics
            case 1 -> "1a3a5c";  // Navy for Fashion
            case 2 -> "2c3e50";  // Dark blue-gray for Home & Garden
            case 3 -> "9c27b0";  // Purple for Sports
            case 4 -> "4a235a";  // Dark purple for Books
            default -> "333333"; // Default dark gray
        };
    }
}
