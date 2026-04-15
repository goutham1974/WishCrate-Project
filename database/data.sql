-- Sample Products Data for WishCrate
-- Clear existing data before inserting
DELETE FROM products;
DELETE FROM categories;

-- Reset sequences
ALTER SEQUENCE categories_id_seq RESTART WITH 1;
ALTER SEQUENCE products_id_seq RESTART WITH 1;

-- Insert sample categories (individual inserts for reliability)
INSERT INTO categories (id, name, description) VALUES (1, 'Electronics', 'Electronic devices and gadgets');
INSERT INTO categories (id, name, description) VALUES (2, 'Fashion', 'Clothing and accessories');
INSERT INTO categories (id, name, description) VALUES (3, 'Home & Garden', 'Home improvement and garden supplies');
INSERT INTO categories (id, name, description) VALUES (4, 'Sports', 'Sports equipment and fitness');
INSERT INTO categories (id, name, description) VALUES (5, 'Books', 'Books and educational materials');

-- Update sequence after explicit ID inserts for PostgreSQL
SELECT setval(pg_get_serial_sequence('categories', 'id'), MAX(id)) FROM categories;

-- Insert sample products
INSERT INTO products (name, description, price, brand, category_id, stock_quantity, image_url, average_rating, total_reviews, active, featured, created_at, updated_at) VALUES
-- Electronics
('Apple iPhone 15 Pro Max 256GB', 'Flagship smartphone with pro camera system and A17 chip', 1199.99, 'Apple', 1, 50, 'https://images.unsplash.com/photo-1592286927505-1fed9c64b371?w=400&h=400&fit=crop', 4.8, 156, true, true, NOW(), NOW()),
('Samsung Galaxy S24 Ultra 512GB', 'Premium Android flagship with S Pen and titanium design', 1299.99, 'Samsung', 1, 45, 'https://images.unsplash.com/photo-1511707267537-b85faf00021e?w=400&h=400&fit=crop', 4.7, 142, true, true, NOW(), NOW()),
('MacBook Pro 14" M3 Max 1TB', 'Professional laptop for creators and developers', 2299.99, 'Apple', 1, 20, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400&h=400&fit=crop', 4.9, 89, true, true, NOW(), NOW()),
('Sony WH-1000XM5 Black', 'Industry leading noise cancellation headphones', 399.99, 'Sony', 1, 30, 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400&h=400&fit=crop', 4.8, 234, true, false, NOW(), NOW()),
('iPad Pro 12.9" Wi-Fi 256GB', 'Ultimate tablet with M2 chip and display excellence', 1099.99, 'Apple', 1, 35, 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=400&h=400&fit=crop', 4.8, 167, true, false, NOW(), NOW()),
('Google Pixel 8 Pro 256GB', 'Camera flagship with advanced AI features', 999.99, 'Google', 1, 38, 'https://images.unsplash.com/photo-1599599810694-200a0cb08141?w=400&h=400&fit=crop', 4.7, 128, true, true, NOW(), NOW()),
('Dell XPS 15 RTX 4070 1TB', 'High-performance laptop for creators and gamers', 1999.99, 'Dell', 1, 25, 'https://images.unsplash.com/photo-1588521621566-8db9906e77d4?w=400&h=400&fit=crop', 4.7, 95, true, false, NOW(), NOW()),
('Samsung 55" QN90D QLED 4K TV', 'Mini-LED backlit 4K TV with quantum dots', 1499.99, 'Samsung', 1, 15, 'https://images.unsplash.com/photo-1545830582-1404142d58fe?w=400&h=400&fit=crop', 4.8, 78, true, true, NOW(), NOW()),
('Apple AirPods Pro (2nd Gen)', 'Premium wireless earbuds with ANC and spatial audio', 249.99, 'Apple', 1, 60, 'https://images.unsplash.com/photo-1606841838239-c5a1a3a0ed5c?w=400&h=400&fit=crop', 4.7, 312, true, true, NOW(), NOW()),
('Canon EOS R6 Mark II Body', 'Professional mirrorless camera 20MP Full Frame', 2499.99, 'Canon', 1, 12, 'https://images.unsplash.com/photo-1606986628025-35d57e735ae0?w=400&h=400&fit=crop', 4.9, 43, true, false, NOW(), NOW()),
('Nintendo Switch OLED White', 'Gaming console with vibrant OLED display', 349.99, 'Nintendo', 1, 55, 'https://images.unsplash.com/photo-1586348943529-beaae6c28db9?w=400&h=400&fit=crop', 4.8, 445, true, true, NOW(), NOW()),
('PlayStation 5 Disc Edition', 'Next-gen gaming console with 4K Blu-ray player', 499.99, 'Sony', 1, 42, 'https://images.unsplash.com/photo-1606841838239-c5a1a3a0ed5c?w=400&h=400&fit=crop', 4.9, 567, true, true, NOW(), NOW()),
('DJI Air 3S Drone', 'Compact camera drone with 48MP sensor and 3x zoom', 999.99, 'DJI', 1, 22, 'https://images.unsplash.com/photo-1586941787620-beccb60ae359?w=400&h=400&fit=crop', 4.8, 89, true, true, NOW(), NOW()),
('Bose QuietComfort Ultra Headphones', 'Customizable ANC with luxurious design', 429.99, 'Bose', 1, 33, 'https://images.unsplash.com/photo-1487215078519-e21cc028cb29?w=400&h=400&fit=crop', 4.7, 156, true, false, NOW(), NOW()),
('LG 27" UltraGear 240Hz Gaming Monitor', 'Nano IPS 1440p gaming display 240Hz', 349.99, 'LG', 1, 28, 'https://images.unsplash.com/photo-1527814050087-3793815479db?w=400&h=400&fit=crop', 4.9, 234, true, true, NOW(), NOW()),

-- Fashion
('Levi''s 501 Original Fit Jeans Men Blue', 'Classic denim jeans with timeless style', 79.99, 'Levi''s', 2, 100, 'https://images.unsplash.com/photo-1542272604-787c62d465d1?w=400&h=400&fit=crop', 4.7, 289, true, true, NOW(), NOW()),
('Nike Air Max 90 White/Black/Red', 'Iconic running shoes with Air cushioning', 129.99, 'Nike', 2, 80, 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400&h=400&fit=crop', 4.8, 567, true, true, NOW(), NOW()),
('Adidas Ultraboost 22 Running Shoes', 'High-performance running sneaker with boost', 189.99, 'Adidas', 2, 70, 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400&h=400&fit=crop', 4.7, 423, true, true, NOW(), NOW()),
('Gap Women''s Cashmere Sweater Gray', 'Premium cashmere crewneck sweater', 149.99, 'Gap', 2, 55, 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400&h=400&fit=crop', 4.8, 234, true, false, NOW(), NOW()),
('Ray-Ban Aviator Sunglasses RB3025', 'Classic pilots style sunglasses with UV protection', 169.99, 'Ray-Ban', 2, 80, 'https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=400&h=400&fit=crop', 4.9, 789, true, true, NOW(), NOW()),
('Jordan 1 Retro High OG Chicago', 'Legendary basketball shoe silhouette', 179.99, 'Jordan', 2, 48, 'https://images.unsplash.com/photo-1516478179778-cb2f7d206c15?w=400&h=400&fit=crop', 4.9, 456, true, true, NOW(), NOW()),
('Zara Woman Black Tailored Blazer', 'Modern fitted blazer for professional styling', 119.99, 'Zara', 2, 85, 'https://images.unsplash.com/photo-1594938298603-c8148c4dae35?w=400&h=400&fit=crop', 4.7, 178, true, false, NOW(), NOW()),
('H&M Women''s Midi Wrap Dress', 'Comfortable wrap dress in vibrant colors', 59.99, 'H&M', 2, 95, 'https://images.unsplash.com/photo-1572336522920-55e4f3dd10cf?w=400&h=400&fit=crop', 4.5, 267, true, true, NOW(), NOW()),
('Timberland 6-Inch Premium Boots Brown', 'Waterproof work boots with comfort', 189.99, 'Timberland', 2, 52, 'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=400&h=400&fit=crop', 4.8, 345, true, false, NOW(), NOW()),
('Fossil Gen 6 Smartwatch Black Leather', 'Stylish smartwatch with fitness tracking', 249.99, 'Fossil', 2, 40, 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400&h=400&fit=crop', 4.5, 198, true, false, NOW(), NOW()),
('Puma RS-X Sneakers White', 'Retro-inspired casual sports sneaker', 99.99, 'Puma', 2, 70, 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400&h=400&fit=crop', 4.6, 234, true, true, NOW(), NOW()),
('ASOS Design Women''s Mini Dress', 'On-trend mini dress for parties and nights out', 59.99, 'ASOS', 2, 90, 'https://images.unsplash.com/photo-1558769132-cb1aea458c5e?w=400&h=400&fit=crop', 4.4, 156, true, true, NOW(), NOW()),
('New Balance 990v6 Running Shoes Gray', 'Premium American-made running shoe', 199.99, 'New Balance', 2, 45, 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400&h=400&fit=crop', 4.8, 289, true, true, NOW(), NOW()),
('Columbia Women''s Winter Parka', 'Insulated waterproof winter jacket', 249.99, 'Columbia', 2, 35, 'https://images.unsplash.com/photo-1539533057440-7db51fe40d90?w=400&h=400&fit=crop', 4.7, 145, true, true, NOW(), NOW()),
('Converse Chuck Taylor All Star Unisex', 'Classic canvas sneaker in multiple colors', 59.99, 'Converse', 2, 120, 'https://images.unsplash.com/photo-1552062407-291846519494?w=400&h=400&fit=crop', 4.7, 567, true, true, NOW(), NOW()),

-- Home & Garden
('Dyson V15 Detect Vacuum Cleaner', 'Cordless vacuum with laser dust detection', 749.99, 'Dyson', 3, 20, 'https://images.unsplash.com/photo-1618204967-52a04c4b13b3?w=400&h=400&fit=crop', 4.8, 234, true, true, NOW(), NOW()),
('Instant Pot Duo Plus 6QT', 'Multi-use electric pressure cooker and slow cooker', 129.99, 'Instant Pot', 3, 45, 'https://images.unsplash.com/photo-1584568694244-14fbbc83bd30?w=400&h=400&fit=crop', 4.9, 1289, true, true, NOW(), NOW()),
('KitchenAid 5-Quart Stand Mixer Red', 'Professional stand mixer for baking', 449.99, 'KitchenAid', 3, 30, 'https://images.unsplash.com/photo-1418873508032-8d56d009a4bb?w=400&h=400&fit=crop', 4.9, 567, true, true, NOW(), NOW()),
('Vitamix 5300 Blender Black', 'Premium high-powered blender for smoothies', 449.99, 'Vitamix', 3, 25, 'https://images.unsplash.com/photo-1584622508411-993a426fbf0a?w=400&h=400&fit=crop', 4.8, 434, true, true, NOW(), NOW()),
('Ninja XXL Air Fryer Oven', 'Large capacity air fryer for families', 169.99, 'Ninja', 3, 40, 'https://images.unsplash.com/photo-1585238341710-4b4e6dedd482?w=400&h=400&fit=crop', 4.7, 289, true, true, NOW(), NOW()),
('Breville Smart Grind Burr Coffee Maker', 'Automatic grinding coffee maker with precision', 249.99, 'Breville', 3, 35, 'https://images.unsplash.com/photo-1577540543835-9e7ae37e3b4a?w=400&h=400&fit=crop', 4.7, 178, true, true, NOW(), NOW()),
('Le Creuset 5.5QT Dutch Oven Orange', 'Enameled cast iron cookware for versatility', 399.99, 'Le Creuset', 3, 28, 'https://images.unsplash.com/photo-1597521980823-7f928f41c2e5?w=400&h=400&fit=crop', 4.9, 345, true, true, NOW(), NOW()),
('Nespresso Vertuo Coffee Maker Chrome', 'Automatic espresso and coffee machine', 249.99, 'Nespresso', 3, 32, 'https://images.unsplash.com/photo-1566694895669-2f01eec4d77f?w=400&h=400&fit=crop', 4.6, 223, true, false, NOW(), NOW()),
('Calphalon Non-Stick Cookware Set 10pc', 'Durable non-stick cookware set', 89.99, 'Calphalon', 3, 50, 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400&h=400&fit=crop', 4.5, 267, true, true, NOW(), NOW()),
('Bamboo Cutting Board Set 3-Piece', 'Eco-friendly cutting boards with handle', 34.99, 'EcoFresh', 3, 75, 'https://images.unsplash.com/photo-1610701596007-11502861dcfa?w=400&h=400&fit=crop', 4.6, 156, true, false, NOW(), NOW()),
('Smart WiFi Thermostat Pro', 'Energy-saving programmable thermostat', 249.99, 'Ecobee', 3, 32, 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop', 4.7, 289, true, true, NOW(), NOW()),
('Levoit Air Purifier HEPA Filter', 'Quiet air purifier with HEPA filtration', 99.99, 'Levoit', 3, 60, 'https://images.unsplash.com/photo-1585771724684-38269d6639fd?w=400&h=400&fit=crop', 4.6, 567, true, true, NOW(), NOW()),
('Luxury Blackout Curtain Panels Pair', 'Thermal insulated blackout curtains', 69.99, 'Sunbrella', 3, 88, 'https://images.unsplash.com/photo-1579003974500-2d79d0dfa6c0?w=400&h=400&fit=crop', 4.5, 145, true, true, NOW(), NOW()),
('Egyptian Cotton Bed Sheet Set 1000TC', 'Premium 4-piece luxury bedding set', 129.99, 'Linenspa', 3, 65, 'https://images.unsplash.com/photo-1585799294527-fb3246b50f1b?w=400&h=400&fit=crop', 4.8, 234, true, true, NOW(), NOW()),
('Philips Hue Smart Light Bulb Starter Kit', 'Color-changing smart LED lighting system', 199.99, 'Philips', 3, 42, 'https://images.unsplash.com/photo-1565183928294-7563f3ce68c9?w=400&h=400&fit=crop', 4.7, 467, true, true, NOW(), NOW()),

-- Sports
('Yoga Mat Premium TPE 6mm Thick', 'Non-slip eco-friendly yoga mat with carrying strap', 79.99, 'FitnessPro', 4, 50, 'https://images.unsplash.com/photo-1579255263049-43c03e0a5b5b?w=400&h=400&fit=crop', 4.8, 456, true, true, NOW(), NOW()),
('Adjustable Dumbbell Set 5-50 lbs', 'Space-saving weights for home gym', 349.99, 'FitnessPro', 4, 25, 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?w=400&h=400&fit=crop', 4.9, 789, true, true, NOW(), NOW()),
('Resistance Band Set 5-Piece Latex', 'Color-coded resistance loop bands set', 29.99, 'PowerPlay', 4, 110, 'https://images.unsplash.com/photo-1596357905594-3a84d10fec5e?w=400&h=400&fit=crop', 4.7, 234, true, true, NOW(), NOW()),
('Peloton Bike+ Digital Fitness', 'Interactive home cycling bike with screen', 1995.00, 'Peloton', 4, 8, 'https://images.unsplash.com/photo-1579722821273-6da0e1e267db?w=400&h=400&fit=crop', 4.8, 345, true, true, NOW(), NOW()),
('NordicTrack T Series Treadmill', 'Folding electric treadmill with incline', 799.99, 'NordicTrack', 4, 12, 'https://images.unsplash.com/photo-1576678927484-cc907957656c?w=400&h=400&fit=crop', 4.6, 178, true, true, NOW(), NOW()),
('Doorway Pull-Up Bar Multi-Grip', 'Portable strength training pull-up bar', 34.99, 'SportGear', 4, 95, 'https://images.unsplash.com/photo-1598971457992-873b0dc1ddfa?w=400&h=400&fit=crop', 4.6, 289, true, true, NOW(), NOW()),
('Speed Jump Rope With Counter', 'Ball bearing professional jump rope', 19.99, 'SportGear', 4, 145, 'https://images.unsplash.com/photo-1599999810694-8bb01f37b9f7?w=400&h=400&fit=crop', 4.5, 134, true, true, NOW(), NOW()),
('Cast Iron Kettlebell 35 lbs', 'Solid cast iron kettlebell weight', 49.99, 'Rogue', 4, 55, 'https://images.unsplash.com/photo-1614438267456-e5df18f4a0db?w=400&h=400&fit=crop', 4.8, 267, true, true, NOW(), NOW()),
('High-Density Foam Roller 12x6in', 'Muscle recovery and trigger point massage', 34.99, 'Trigger', 4, 82, 'https://images.unsplash.com/photo-1578829201358-7941c1c27f12?w=400&h=400&fit=crop', 4.7, 456, true, true, NOW(), NOW()),
('Stainless Steel Shaker Bottle 28oz', 'Protein shaker with mixing ball', 24.99, 'Blender Bottle', 4, 120, 'https://images.unsplash.com/photo-1624526267942-ab67cb38121d?w=400&h=400&fit=crop', 4.6, 178, true, true, NOW(), NOW()),
('Under Armour Duffel Gym Bag Large', 'Waterproof sports gear duffle bag', 59.99, 'Under Armour', 4, 68, 'https://images.unsplash.com/photo-1553894180-8f7ee3bf4f4d?w=400&h=400&fit=crop', 4.7, 234, true, true, NOW(), NOW()),
('JBL Endurance Sport Wireless Earbuds', 'Waterproof sports earbuds with earmold', 99.99, 'JBL', 4, 72, 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400&h=400&fit=crop', 4.6, 289, true, true, NOW(), NOW()),
('Garmin Forerunner 255 Smartwatch', 'GPS running watch with training metrics', 299.99, 'Garmin', 4, 45, 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400&h=400&fit=crop', 4.8, 345, true, true, NOW(), NOW()),
('Compression Clothing Set Active Wear', 'Moisture-wicking compression sports set', 79.99, 'Skins', 4, 35, 'https://images.unsplash.com/photo-1506629082632-401ba50ce352?w=400&h=400&fit=crop', 4.5, 156, true, false, NOW(), NOW()),
('Tactical Gym Bag 50L Rucksack', 'Military-style tactical training gear bag', 149.99, 'LAPG', 4, 28, 'https://images.unsplash.com/photo-1553894180-8f7ee3bf4f4d?w=400&h=400&fit=crop', 4.6, 89, true, false, NOW(), NOW()),

-- Books  
('The Midnight Library Book', 'Contemporary fiction bestseller', 16.99, 'Matt Haig', 5, 75, 'https://images.unsplash.com/photo-150784272343-583f20270319?w=400&h=500&fit=crop', 0.0, 0, true, false, NOW(), NOW()),
('Atomic Habits Book', 'Best-selling self-improvement book', 18.99, 'James Clear', 5, 60, 'https://images.unsplash.com/photo-1507842728860-ce0b0047dcd6?w=400&h=500&fit=crop', 0.0, 0, true, false, NOW(), NOW()),
('1984 by George Orwell', 'Classic dystopian novel', 13.99, 'George Orwell', 5, 85, 'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?w=400&h=500&fit=crop', 0.0, 0, true, false, NOW(), NOW()),
('The Great Gatsby', 'American classic literature', 12.99, 'F. Scott Fitzgerald', 5, 90, 'https://images.unsplash.com/photo-1507842721754-82ec65d548ca?w=400&h=500&fit=crop', 0.0, 0, true, false, NOW(), NOW()),
('The Hobbit', 'Fantasy adventure classic by J.R.R. Tolkien', 14.99, 'J.R.R. Tolkien', 5, 85, 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400&h=500&fit=crop', 0.0, 0, true, false, NOW(), NOW()),
('Dune', 'Epic science fiction masterpiece', 17.99, 'Frank Herbert', 5, 70, 'https://images.unsplash.com/photo-1507842721365-b66d92a2bf0c?w=400&h=500&fit=crop', 0.0, 0, true, false, NOW(), NOW()),
('To Kill a Mockingbird', 'American literary classic', 13.99, 'Harper Lee', 5, 95, 'https://images.unsplash.com/photo-1516979187457-635ffe35ff81?w=400&h=500&fit=crop', 0.0, 0, true, false, NOW(), NOW()),
('The Catcher in the Rye', 'Coming of age novel', 14.99, 'J.D. Salinger', 5, 75, 'https://images.unsplash.com/photo-1507842721365-b66d92a2bf0b?w=400&h=500&fit=crop', 0.0, 0, true, false, NOW(), NOW()),
('Sapiens', 'History of humankind', 19.99, 'Yuval Noah Harari', 5, 62, 'https://images.unsplash.com/photo-1506880018603-83d5b814b5a6?w=400&h=500&fit=crop', 0.0, 0, true, false, NOW(), NOW()),
('Thinking, Fast and Slow', 'Psychology and decision making', 18.99, 'Daniel Kahneman', 5, 58, 'https://images.unsplash.com/photo-1507842721294-46edaf8da65c?w=400&h=500&fit=crop', 0.0, 0, true, false, NOW(), NOW()),
('The Art of War', 'Ancient military strategy classic', 9.99, 'Sun Tzu', 5, 110, 'https://images.unsplash.com/photo-1507842721234-91fda3b2d9f2?w=400&h=500&fit=crop', 0.0, 0, true, false, NOW(), NOW()),
('Educated', 'Memoir of survival and education', 16.99, 'Tara Westover', 5, 68, 'https://images.unsplash.com/photo-1507842721304-9ffdcb872345?w=400&h=500&fit=crop', 0.0, 0, true, false, NOW(), NOW()),
('Becoming', 'Michelle Obama memoir', 17.99, 'Michelle Obama', 5, 73, 'https://images.unsplash.com/photo-1507842721294-d45d89e8afd7?w=400&h=500&fit=crop', 0.0, 0, true, false, NOW(), NOW()),
('The Alchemist', 'Philosophical fiction', 15.99, 'Paulo Coelho', 5, 98, 'https://images.unsplash.com/photo-1507842721345-d45d89e8afd8?w=400&h=500&fit=crop', 0.0, 0, true, false, NOW(), NOW()),
('Rich Dad Poor Dad', 'Personal finance guide', 17.99, 'Robert Kiyosaki', 5, 54, 'https://images.unsplash.com/photo-1507842721367-d45d89e8afd9?w=400&h=500&fit=crop', 0.0, 0, true, false, NOW(), NOW());

-- Insert sample regular user for testing (handles duplicates gracefully)
-- NOTE: Create admin user through secure admin creation endpoint in production
-- DO NOT hardcode credentials in source code files
INSERT INTO users (email, password, first_name, last_name, phone_number, role, enabled, created_at, updated_at) VALUES
('user@example.com', '$2a$10$slYQmyNdGzin7olVN3p5Be7DQnt7SZgPlgdly/tsQvgnQvnIGEHze', 'John', 'Doe', '9876543210', 'USER', true, NOW(), NOW()),
('admin@example.com', '$2a$10$slYQmyNdGzin7olVN3p5Be7DQnt7SZgPlgdly/tsQvgnQvnIGEHze', 'Admin', 'User', '1111111111', 'ADMIN', true, NOW(), NOW())
ON CONFLICT (email) DO UPDATE SET updated_at = NOW();
