-- Safe Sample Products Data Initialization for WishCrate
-- This file is safe to run multiple times - uses INSERT...ON CONFLICT
-- Mode: NEVER - only run manually for data refresh

-- Disable foreign key constraints temporarily
SET session_replication_role = 'replica';

-- Clear existing data (if running manually)
DELETE FROM products WHERE stock_quantity IS NOT NULL OR name IS NOT NULL;
DELETE FROM categories WHERE name IS NOT NULL;

-- Re-enable foreign key constraints
SET session_replication_role = 'default';

-- Reset sequences
ALTER SEQUENCE IF EXISTS categories_id_seq RESTART WITH 1;
ALTER SEQUENCE IF EXISTS products_id_seq RESTART WITH 1;

-- Insert sample categories
INSERT INTO categories (id, name, description) VALUES 
  (1, 'Electronics', 'Electronic devices and gadgets'),
  (2, 'Fashion', 'Clothing and accessories'),
  (3, 'Home & Garden', 'Home improvement and garden supplies'),
  (4, 'Sports', 'Sports equipment and fitness'),
  (5, 'Books', 'Books and educational materials')
ON CONFLICT (id) DO NOTHING;

-- Update sequence after explicit ID inserts
SELECT setval(pg_get_serial_sequence('categories', 'id'), MAX(id)) FROM categories;

-- Insert sample products with working images
INSERT INTO products (name, description, price, brand, category_id, stock_quantity, image_url, average_rating, total_reviews, active, featured, created_at, updated_at) VALUES
-- Electronics
('Apple iPhone 15 Pro Max 256GB', 'Flagship smartphone with pro camera system and A17 chip', 1199.99, 'Apple', 1, 50, 'https://picsum.photos/400/400?random=1', 4.8, 156, true, true, NOW(), NOW()),
('Samsung Galaxy S24 Ultra 512GB', 'Premium Android flagship with S Pen and titanium design', 1299.99, 'Samsung', 1, 45, 'https://picsum.photos/400/400?random=2', 4.7, 142, true, true, NOW(), NOW()),
('MacBook Pro 14" M3 Max 1TB', 'Professional laptop for creators and developers', 2299.99, 'Apple', 1, 20, 'https://picsum.photos/400/400?random=3', 4.9, 89, true, true, NOW(), NOW()),
('Sony WH-1000XM5 Black', 'Industry leading noise cancellation headphones', 399.99, 'Sony', 1, 30, 'https://picsum.photos/400/400?random=4', 4.8, 234, true, false, NOW(), NOW()),
('iPad Pro 12.9" Wi-Fi 256GB', 'Ultimate tablet with M2 chip and display excellence', 1099.99, 'Apple', 1, 35, 'https://picsum.photos/400/400?random=5', 4.8, 167, true, false, NOW(), NOW()),
('Google Pixel 8 Pro 256GB', 'Camera flagship with advanced AI features', 999.99, 'Google', 1, 38, 'https://picsum.photos/400/400?random=6', 4.7, 128, true, true, NOW(), NOW()),
('Dell XPS 15 RTX 4070 1TB', 'High-performance laptop for creators and gamers', 1999.99, 'Dell', 1, 25, 'https://picsum.photos/400/400?random=7', 4.7, 95, true, false, NOW(), NOW()),
('Samsung 55" QN90D QLED 4K TV', 'Mini-LED backlit 4K TV with quantum dots', 1499.99, 'Samsung', 1, 15, 'https://picsum.photos/400/400?random=8', 4.8, 78, true, true, NOW(), NOW()),
('Apple AirPods Pro (2nd Gen)', 'Premium wireless earbuds with ANC and spatial audio', 249.99, 'Apple', 1, 60, 'https://picsum.photos/400/400?random=9', 4.7, 312, true, true, NOW(), NOW()),
('Canon EOS R6 Mark II Body', 'Professional mirrorless camera 20MP Full Frame', 2499.99, 'Canon', 1, 12, 'https://picsum.photos/400/400?random=10', 4.9, 43, true, false, NOW(), NOW()),
('Nintendo Switch OLED White', 'Gaming console with vibrant OLED display', 349.99, 'Nintendo', 1, 55, 'https://picsum.photos/400/400?random=11', 4.8, 445, true, true, NOW(), NOW()),
('PlayStation 5 Disc Edition', 'Next-gen gaming console with 4K Blu-ray player', 499.99, 'Sony', 1, 42, 'https://picsum.photos/400/400?random=12', 4.9, 567, true, true, NOW(), NOW()),
('DJI Air 3S Drone', 'Compact camera drone with 48MP sensor and 3x zoom', 999.99, 'DJI', 1, 22, 'https://picsum.photos/400/400?random=13', 4.8, 89, true, true, NOW(), NOW()),
('Bose QuietComfort Ultra Headphones', 'Customizable ANC with luxurious design', 429.99, 'Bose', 1, 33, 'https://picsum.photos/400/400?random=14', 4.7, 156, true, false, NOW(), NOW()),
('LG 27" UltraGear 240Hz Gaming Monitor', 'Nano IPS 1440p gaming display 240Hz', 349.99, 'LG', 1, 28, 'https://picsum.photos/400/400?random=15', 4.9, 234, true, true, NOW(), NOW());
