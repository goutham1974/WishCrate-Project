-- Populate product_images table (ElementCollection for Product.images)
-- This maps each product's image_url to the images array

-- First, ensure product_images table is created (Hibernate should create it)
-- Then populate it with image_url from products table

DELETE FROM product_images;

-- Insert image URLs from products into the product_images collection table
INSERT INTO product_images (product_id, images)
SELECT id, image_url FROM products WHERE image_url IS NOT NULL;

-- Verify inserts
SELECT COUNT(*) as total_images FROM product_images;
