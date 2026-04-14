-- Sample Products Data for WishCrate
-- This file is automatically loaded by Spring Boot on startup

-- Insert sample categories
INSERT INTO categories (name, description) VALUES 
('Electronics', 'Electronic devices and gadgets'),
('Fashion', 'Clothing and accessories'),
('Home & Garden', 'Home improvement and garden supplies'),
('Sports', 'Sports equipment and fitness'),
('Books', 'Books and educational materials')
ON CONFLICT DO NOTHING;

-- Insert sample products
INSERT INTO products (name, description, price, brand, category_id, stock_quantity, image_url, average_rating, total_reviews, active, created_at, updated_at) VALUES
-- Electronics
('Apple iPhone 15 Pro', 'Latest iPhone with advanced camera and processor', 999.99, 'Apple', 1, 50, 'https://via.placeholder.com/300?text=iPhone+15', 0.0, 0, true, NOW(), NOW()),
('Samsung Galaxy S24', 'Flagship Android smartphone with 5G', 899.99, 'Samsung', 1, 45, 'https://via.placeholder.com/300?text=Galaxy+S24', 0.0, 0, true, NOW(), NOW()),
('Sony WH-1000XM5 Headphones', 'Premium noise-cancelling wireless headphones', 399.99, 'Sony', 1, 30, 'https://via.placeholder.com/300?text=Sony+Headphones', 0.0, 0, true, NOW(), NOW()),
('MacBook Pro 14"', 'Professional laptop with M3 Max chip', 1999.99, 'Apple', 1, 20, 'https://via.placeholder.com/300?text=MacBook+Pro', 0.0, 0, true, NOW(), NOW()),
('iPad Air', 'Powerful tablet for work and creativity', 599.99, 'Apple', 1, 35, 'https://via.placeholder.com/300?text=iPad+Air', 0.0, 0, true, NOW(), NOW()),
('Smart Watch Pro', 'Fitness tracking smartwatch with AMOLED display', 299.99, 'TechBrand', 1, 40, 'https://via.placeholder.com/300?text=SmartWatch', 0.0, 0, true, NOW(), NOW()),
('Google Pixel 8 Pro', 'AI-powered Android flagship phone', 949.99, 'Google', 1, 38, 'https://via.placeholder.com/300?text=Pixel+8+Pro', 0.0, 0, true, NOW(), NOW()),
('Dell XPS 15 Laptop', 'High-performance laptop for creators', 1599.99, 'Dell', 1, 25, 'https://via.placeholder.com/300?text=Dell+XPS', 0.0, 0, true, NOW(), NOW()),
('LG OLED 55" TV', '4K OLED television with stunning picture quality', 1499.99, 'LG', 1, 15, 'https://via.placeholder.com/300?text=OLED+TV', 0.0, 0, true, NOW(), NOW()),
('AirPods Pro Max', 'Premium over-ear wireless headphones', 549.99, 'Apple', 1, 28, 'https://via.placeholder.com/300?text=AirPods+Max', 0.0, 0, true, NOW(), NOW()),
('Canon EOS R6 Camera', 'Professional mirrorless camera', 2499.99, 'Canon', 1, 12, 'https://via.placeholder.com/300?text=Canon+Camera', 0.0, 0, true, NOW(), NOW()),
('Nintendo Switch Pro', 'Gaming console with high performance', 349.99, 'Nintendo', 1, 55, 'https://via.placeholder.com/300?text=Switch+Pro', 0.0, 0, true, NOW(), NOW()),
('PlayStation 5', '4K gaming console with fast SSD storage', 499.99, 'Sony', 1, 42, 'https://via.placeholder.com/300?text=PS5', 0.0, 0, true, NOW(), NOW()),
('DJI Mini 4 Pro Drone', 'Compact and powerful drone for aerial photography', 759.99, 'DJI', 1, 22, 'https://via.placeholder.com/300?text=DJI+Drone', 0.0, 0, true, NOW(), NOW()),
('Bose QuietComfort 45', 'Over-ear headphones with active noise cancellation', 379.99, 'Bose', 1, 33, 'https://via.placeholder.com/300?text=Bose+Headphones', 0.0, 0, true, NOW(), NOW()),

-- Fashion
('Levi''s Blue Denim Jeans', 'Classic 501 blue denim jeans for men', 79.99, 'Levi''s', 2, 100, 'https://via.placeholder.com/300?text=Levi+Jeans', 0.0, 0, true, NOW(), NOW()),
('Nike Air Max 90', 'Iconic running shoes with cushioned sole', 129.99, 'Nike', 2, 80, 'https://via.placeholder.com/300?text=Nike+Shoes', 0.0, 0, true, NOW(), NOW()),
('Adidas Sports T-Shirt', 'Breathable sports t-shirt', 49.99, 'Adidas', 2, 120, 'https://via.placeholder.com/300?text=Adidas+Tshirt', 0.0, 0, true, NOW(), NOW()),
('Winter Jacket', 'Insulated winter jacket for cold weather', 199.99, 'Columbia', 2, 55, 'https://via.placeholder.com/300?text=Winter+Jacket', 0.0, 0, true, NOW(), NOW()),
('Designer Sunglasses', 'UV protection designer glasses', 149.99, 'RayBan', 2, 65, 'https://via.placeholder.com/300?text=Sunglasses', 0.0, 0, true, NOW(), NOW()),
('Jordan 1 Retro High', 'Classic air Jordan basketball shoes', 179.99, 'Jordan', 2, 48, 'https://via.placeholder.com/300?text=Jordan+1', 0.0, 0, true, NOW(), NOW()),
('Louis Vuitton Clutch', 'Luxury leather clutch bag', 899.99, 'Louis Vuitton', 2, 18, 'https://via.placeholder.com/300?text=LV+Clutch', 0.0, 0, true, NOW(), NOW()),
('Gucci Backpack', 'Designer canvas backpack with leather accents', 599.99, 'Gucci', 2, 25, 'https://via.placeholder.com/300?text=Gucci+Backpack', 0.0, 0, true, NOW(), NOW()),
('Puma Running Shoes', 'Lightweight athletic running shoes', 99.99, 'Puma', 2, 70, 'https://via.placeholder.com/300?text=Puma+Shoes', 0.0, 0, true, NOW(), NOW()),
('Zara Black Blazer', 'Elegant tailored blazer for work', 129.99, 'Zara', 2, 85, 'https://via.placeholder.com/300?text=Zara+Blazer', 0.0, 0, true, NOW(), NOW()),
('H&M Summer Dress', 'Light and comfortable summer dress', 44.99, 'H&M', 2, 95, 'https://via.placeholder.com/300?text=HM+Dress', 0.0, 0, true, NOW(), NOW()),
('Timberland Boots', 'Waterproof work boots', 189.99, 'Timberland', 2, 52, 'https://via.placeholder.com/300?text=Timberland+Boots', 0.0, 0, true, NOW(), NOW()),
('Fossil Watch', 'Casual leather strap watch', 149.99, 'Fossil', 2, 40, 'https://via.placeholder.com/300?text=Fossil+Watch', 0.0, 0, true, NOW(), NOW()),
('Wool Beanie', 'Warm winter beanie cap', 24.99, 'North Face', 2, 110, 'https://via.placeholder.com/300?text=Beanie', 0.0, 0, true, NOW(), NOW()),

-- Home & Garden
('Gardening Tool Set', 'Complete gardening tool set with 15 pieces', 59.99, 'GreenThumb', 3, 40, 'https://via.placeholder.com/300?text=Garden+Tools', 0.0, 0, true, NOW(), NOW()),
('Potted Indoor Plant', 'Beautiful pothos plant in ceramic pot', 34.99, 'PlantLife', 3, 60, 'https://via.placeholder.com/300?text=Plant', 0.0, 0, true, NOW(), NOW()),
('LED String Lights', 'Decorative LED lights, warm white 20m', 29.99, 'HomeDecor', 3, 100, 'https://via.placeholder.com/300?text=LED+Lights', 0.0, 0, true, NOW(), NOW()),
('Stainless Steel Cookware Set', '10-piece non-stick cookware set', 189.99, 'Cuisinart', 3, 35, 'https://via.placeholder.com/300?text=Cookware', 0.0, 0, true, NOW(), NOW()),
('Bamboo Cutting Board Set', 'Set of 3 bamboo cutting boards', 34.99, 'EcoFresh', 3, 75, 'https://via.placeholder.com/300?text=Cutting+Boards', 0.0, 0, true, NOW(), NOW()),
('Raised Garden Bed', '4x8 ft elevated wooden planter', 129.99, 'GardenMasters', 3, 28, 'https://via.placeholder.com/300?text=Raised+Bed', 0.0, 0, true, NOW(), NOW()),
('Smart Thermostat', 'WiFi-enabled smart home thermostat', 249.99, 'Ecobee', 3, 32, 'https://via.placeholder.com/300?text=Thermostat', 0.0, 0, true, NOW(), NOW()),
('Blackout Curtains', 'Thermal blackout curtain panels', 69.99, 'Sunbrella', 3, 88, 'https://via.placeholder.com/300?text=Curtains', 0.0, 0, true, NOW(), NOW()),
('Microfiber Bedding Set', 'Luxury 4-piece bedding set queen size', 99.99, 'Linenspa', 3, 65, 'https://via.placeholder.com/300?text=Bedding', 0.0, 0, true, NOW(), NOW()),
('Wall-Mounted Shelves', 'Floating wooden shelves 24" width', 49.99, 'SimpleDecor', 3, 92, 'https://via.placeholder.com/300?text=Shelves', 0.0, 0, true, NOW(), NOW()),
('Area Rug 8x10', 'Persian style area rug', 199.99, 'rug.com', 3, 20, 'https://via.placeholder.com/300?text=Area+Rug', 0.0, 0, true, NOW(), NOW()),
('Desk Lamp LED', 'Modern LED desk lamp with USB charging', 44.99, 'LightWorks', 3, 78, 'https://via.placeholder.com/300?text=Desk+Lamp', 0.0, 0, true, NOW(), NOW()),
('Kitchen Knife Set', '5-piece German stainless steel knife set', 89.99, 'Zwilling', 3, 48, 'https://via.placeholder.com/300?text=Knives', 0.0, 0, true, NOW(), NOW()),

-- Sports
('Yoga Mat Premium', 'Non-slip premium yoga mat 6mm thick', 79.99, 'FitnessPro', 4, 50, 'https://via.placeholder.com/300?text=Yoga+Mat', 0.0, 0, true, NOW(), NOW()),
('Dumbbells Set', 'Adjustable dumbbells 5-25 lbs', 149.99, 'FitnessPro', 4, 25, 'https://via.placeholder.com/300?text=Dumbbells', 0.0, 0, true, NOW(), NOW()),
('Resistance Bands Set', '5-piece resistance loop bands', 29.99, 'PowerPlay', 4, 110, 'https://via.placeholder.com/300?text=Bands', 0.0, 0, true, NOW(), NOW()),
('Stationary Exercise Bike', 'Indoor cycling bike with digital display', 399.99, 'Peloton', 4, 16, 'https://via.placeholder.com/300?text=Bike', 0.0, 0, true, NOW(), NOW()),
('Treadmill Pro', 'Electric treadmill with incline function', 799.99, 'NordicTrack', 4, 12, 'https://via.placeholder.com/300?text=Treadmill', 0.0, 0, true, NOW(), NOW()),
('Pull-up Bar', 'Doorway pull-up bar for strength training', 34.99, 'SportGear', 4, 95, 'https://via.placeholder.com/300?text=Pull+Up+Bar', 0.0, 0, true, NOW(), NOW()),
('Jump Rope', 'Speed jump rope with counter', 19.99, 'SportGear', 4, 145, 'https://via.placeholder.com/300?text=Jump+Rope', 0.0, 0, true, NOW(), NOW()),
('Kettlebell 35lb', 'Cast iron kettlebell weight', 49.99, 'Rogue', 4, 55, 'https://via.placeholder.com/300?text=Kettlebell', 0.0, 0, true, NOW(), NOW()),
('Foam Roller', 'High-density muscle recovery foam roller', 34.99, 'Trigger', 4, 82, 'https://via.placeholder.com/300?text=Foam+Roller', 0.0, 0, true, NOW(), NOW()),
('Protein Shaker Bottle', 'Stainless steel protein shaker with mesh', 24.99, 'Blender Bottle', 4, 120, 'https://via.placeholder.com/300?text=Shaker', 0.0, 0, true, NOW(), NOW()),
('Gym Bag', 'Large waterproof gym duffle bag', 59.99, 'Under Armour', 4, 68, 'https://via.placeholder.com/300?text=Gym+Bag', 0.0, 0, true, NOW(), NOW()),
('Bluetooth Sports Earbuds', 'Wireless earbuds for workouts', 89.99, 'JBL', 4, 72, 'https://via.placeholder.com/300?text=Earbuds', 0.0, 0, true, NOW(), NOW()),
('Fitness Tracker Watch', 'Wristband activity tracker', 129.99, 'Fitbit', 4, 56, 'https://via.placeholder.com/300?text=Fitness+Watch', 0.0, 0, true, NOW(), NOW()),

-- Books  
('The Midnight Library Book', 'Contemporary fiction bestseller', 16.99, 'Matt Haig', 5, 75, 'https://via.placeholder.com/300?text=Midnight+Library', 0.0, 0, true, NOW(), NOW()),
('Atomic Habits Book', 'Best-selling self-improvement book', 18.99, 'James Clear', 5, 60, 'https://via.placeholder.com/300?text=Atomic+Habits', 0.0, 0, true, NOW(), NOW()),
('1984 by George Orwell', 'Classic dystopian novel', 13.99, 'George Orwell', 5, 85, 'https://via.placeholder.com/300?text=1984', 0.0, 0, true, NOW(), NOW()),
('The Great Gatsby', 'American classic literature', 12.99, 'F. Scott Fitzgerald', 5, 90, 'https://via.placeholder.com/300?text=Great+Gatsby', 0.0, 0, true, NOW(), NOW()),
('The Hobbit', 'Fantasy adventure classic by J.R.R. Tolkien', 14.99, 'J.R.R. Tolkien', 5, 85, 'https://via.placeholder.com/300?text=Hobbit', 0.0, 0, true, NOW(), NOW()),
('Dune', 'Epic science fiction masterpiece', 17.99, 'Frank Herbert', 5, 70, 'https://via.placeholder.com/300?text=Dune', 0.0, 0, true, NOW(), NOW()),
('To Kill a Mockingbird', 'American literary classic', 13.99, 'Harper Lee', 5, 95, 'https://via.placeholder.com/300?text=Mockingbird', 0.0, 0, true, NOW(), NOW()),
('The Catcher in the Rye', 'Coming of age novel', 14.99, 'J.D. Salinger', 5, 75, 'https://via.placeholder.com/300?text=Catcher', 0.0, 0, true, NOW(), NOW()),
('Sapiens', 'History of humankind', 19.99, 'Yuval Noah Harari', 5, 62, 'https://via.placeholder.com/300?text=Sapiens', 0.0, 0, true, NOW(), NOW()),
('Thinking, Fast and Slow', 'Psychology and decision making', 18.99, 'Daniel Kahneman', 5, 58, 'https://via.placeholder.com/300?text=Thinking', 0.0, 0, true, NOW(), NOW()),
('The Art of War', 'Ancient military strategy classic', 9.99, 'Sun Tzu', 5, 110, 'https://via.placeholder.com/300?text=Art+of+War', 0.0, 0, true, NOW(), NOW()),
('Educated', 'Memoir of survival and education', 16.99, 'Tara Westover', 5, 68, 'https://via.placeholder.com/300?text=Educated', 0.0, 0, true, NOW(), NOW()),
('Becoming', 'Michelle Obama memoir', 17.99, 'Michelle Obama', 5, 73, 'https://via.placeholder.com/300?text=Becoming', 0.0, 0, true, NOW(), NOW()),
('The Alchemist', 'Philosophical fiction', 15.99, 'Paulo Coelho', 5, 98, 'https://via.placeholder.com/300?text=Alchemist', 0.0, 0, true, NOW(), NOW()),
('Rich Dad Poor Dad', 'Personal finance guide', 17.99, 'Robert Kiyosaki', 5, 54, 'https://via.placeholder.com/300?text=Rich+Dad', 0.0, 0, true, NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Insert sample regular user for testing
-- NOTE: Create admin user through secure admin creation endpoint in production
-- DO NOT hardcode credentials in source code files
INSERT INTO users (email, password, first_name, last_name, phone, role, created_at, updated_at) VALUES
('user@example.com', '$2a$10$slYQmyNdGzin7olVN3p5Be7DQnt7SZgPlgdly/tsQvgnQvnIGEHze', 'John', 'Doe', '9876543210', 'USER', NOW(), NOW())
ON CONFLICT DO NOTHING;
