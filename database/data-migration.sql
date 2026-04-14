-- Migration script to populate image_url for all products with proper displayable images
-- This ensures all products have loadable image URLs from placehold.co

UPDATE products SET image_url = 'https://placehold.co/400x400/1f1f1f/ffffff?text=iPhone+15' WHERE image_url IS NULL AND id IN (SELECT id FROM products WHERE name LIKE '%iPhone%' LIMIT 1);
UPDATE products SET image_url = 'https://placehold.co/400x400/1a73e8/ffffff?text=Galaxy' WHERE image_url IS NULL AND id IN (SELECT id FROM products WHERE name LIKE '%Galaxy%' LIMIT 1);
UPDATE products SET image_url = 'https://placehold.co/400x400/2c2c2c/ffffff?text=MacBook' WHERE image_url IS NULL AND id IN (SELECT id FROM products WHERE name LIKE '%MacBook%' LIMIT 1);
UPDATE products SET image_url = 'https://placehold.co/400x400/000000/ffffff?text=Headphones' WHERE image_url IS NULL AND id IN (SELECT id FROM products WHERE name LIKE '%Headphones%' LIMIT 1);
UPDATE products SET image_url = 'https://placehold.co/400x400/3a6ea5/ffffff?text=iPad' WHERE image_url IS NULL AND id IN (SELECT id FROM products WHERE name LIKE '%iPad%' LIMIT 1);

-- Update all remaining products with null/empty imageUrl to use placehold.co with default colors
UPDATE products SET image_url = 'https://placehold.co/400x400/333333/ffffff?text=Product_' || CAST(id AS VARCHAR) WHERE image_url IS NULL OR image_url = '';

-- Update books category with book-specific placeholder colors
UPDATE products SET image_url = 'https://placehold.co/300x300/4a235a/ffffff?text=Book' WHERE category_id = 5 AND image_url LIKE '%333333%';
