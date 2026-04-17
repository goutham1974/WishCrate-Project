-- Sample Products Data for WishCrate - With Product-Specific Images
-- Clear existing data before inserting
DELETE FROM products;
DELETE FROM categories;

-- Reset sequences
ALTER SEQUENCE categories_id_seq RESTART WITH 1;
ALTER SEQUENCE products_id_seq RESTART WITH 1;

-- Insert sample categories
INSERT INTO categories (id, name, description) VALUES (1, 'Electronics', 'Electronic devices and gadgets');
INSERT INTO categories (id, name, description) VALUES (2, 'Fashion', 'Clothing and accessories');
INSERT INTO categories (id, name, description) VALUES (3, 'Home & Garden', 'Home improvement and garden supplies');
INSERT INTO categories (id, name, description) VALUES (4, 'Sports', 'Sports equipment and fitness');
INSERT INTO categories (id, name, description) VALUES (5, 'Books', 'Books and educational materials');

-- Update sequence after explicit ID inserts
SELECT setval(pg_get_serial_sequence('categories', 'id'), MAX(id)) FROM categories;

-- Insert sample products with AUTHENTIC PRODUCT IMAGES
INSERT INTO products (name, description, price, brand, category_id, stock_quantity, image_url, average_rating, total_reviews, active, featured, created_at, updated_at, discount_price) VALUES
-- Electronics - AUTHENTIC PRODUCT IMAGES
('Apple iPhone 15 Pro Max 256GB', 'Flagship smartphone with pro camera system and A17 chip', 1199.99, 'Apple', 1, 50, 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MQAL3ref_FV402ref_GEO_US?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1694713662726', 4.8, 156, true, true, NOW(), NOW(), 1099.99),
('Samsung Galaxy S24 Ultra 512GB', 'Premium Android flagship with S Pen and titanium design', 1299.99, 'Samsung', 1, 45, 'https://images.samsung.com/us/smartphones/galaxy-s24-ultra/buy/product/s24u_titanium_black_front_back.jpg', 4.7, 142, true, true, NOW(), NOW(), 1199.99),
('MacBook Pro 14" M3 Max 1TB', 'Professional laptop for creators and developers', 2299.99, 'Apple', 1, 20, 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mbp-14-m3max-spacegray-201610?wid=1144&hei=1144&fmt=jpeg&qlt=90', 4.9, 89, true, true, NOW(), NOW(), 1999.99),
('Sony WH-1000XM5 Black', 'Industry leading noise cancellation headphones', 399.99, 'Sony', 1, 30, 'https://www.sony.com/image/4e73b5dd3fce434e72bba9c4d8f9f3f4?fmt=pjpeg&wid=660&bgcolor=FFFFFF&bgc=FFFFFF', 4.8, 234, true, false, NOW(), NOW(), 349.99),
('iPad Pro 12.9" Wi-Fi 256GB', 'Ultimate tablet with M2 chip and display excellence', 1099.99, 'Apple', 1, 35, 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipadpro-12_7-select-wifi-spacegray-202410?wid=1144&hei=1144&fmt=jpeg&qlt=90', 4.8, 167, true, false, NOW(), NOW(), 999.99),
('Google Pixel 8 Pro 256GB', 'Camera flagship with advanced AI features', 999.99, 'Google', 1, 38, 'https://lh3.googleusercontent.com/z-xJjnNUuN1tJZbmKk_D-3xI47xrFZx4jZxTGr_FKKM_P5hPSJvGmEjVJcPKMSTPQAKQSyHyA-tBCNVVhg=rw-w1088', 4.7, 128, true, true, NOW(), NOW(), 899.99),
('Dell XPS 15 RTX 4070 1TB', 'High-performance laptop for creators and gamers', 1999.99, 'Dell', 1, 25, 'https://i.dell.com/is/image/DellContent/contexts/sites/Corp/Home/XPS/xps-15-hero-image-01?fmt=pjpeg&wid=600', 4.7, 95, true, false, NOW(), NOW(), 1799.99),
('Samsung 55" QN90D QLED 4K TV', 'Mini-LED backlit 4K TV with quantum dots', 1499.99, 'Samsung', 1, 15, 'https://images.samsung.com/us/televisions/tvs/86-in-class-qn90d-qled-4k-smart-tv-2024.jpg', 4.8, 78, true, true, NOW(), NOW(), 1299.99),
('Apple AirPods Pro (2nd Gen)', 'Premium wireless earbuds with ANC and spatial audio', 249.99, 'Apple', 1, 60, 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MTJV3ref_FV402ref_GEO_US?wid=1144&hei=1144&fmt=jpeg&qlt=90', 4.7, 312, true, true, NOW(), NOW(), 219.99),
('Canon EOS R6 Mark II Body', 'Professional mirrorless camera 20MP Full Frame', 2499.99, 'Canon', 1, 12, 'https://www.canon.com.au/contents/product/eos-r6mark2-front-1200.png', 4.9, 43, true, false, NOW(), NOW(), 2299.99),
('Nintendo Switch OLED White', 'Gaming console with vibrant OLED display', 349.99, 'Nintendo', 1, 55, 'https://media.nintendo.com/nintendo/bin/content/dam/corporate/images/game-systems/switch/switch-oled/hero-image.jpg', 4.8, 445, true, true, NOW(), NOW(), 319.99),
('PlayStation 5 Disc Edition', 'Next-gen gaming console with 4K Blu-ray player', 499.99, 'Sony', 1, 42, 'https://www.playstation.com/cdn-cgi/image/width=1200,quality=80,format=auto/https://www.playstation.com/content/dam/games/ps5/ps5-console-hero-image.jpg', 4.9, 567, true, true, NOW(), NOW(), 449.99),
('DJI Air 3S Drone', 'Compact camera drone with 48MP sensor and 3x zoom', 999.99, 'DJI', 1, 22, 'https://www.dji.com/air-3s/image/5ca0a3be-43a6-43d9-8ee2-35e91f6f8c24?fm=jpg&fit=cover&w=1200&h=627', 4.8, 89, true, true, NOW(), NOW(), 899.99),
('Bose QuietComfort Ultra Headphones', 'Customizable ANC with luxurious design', 429.99, 'Bose', 1, 33, 'https://www.bose.com/p/earphones/bose-quietcomfort-ultra-headphones/QCULTRAHP/image/0dfb5800-edc8-4f46-8c9e-48e6267fc59e', 4.7, 156, true, false, NOW(), NOW(), 379.99),
('LG 27" UltraGear 240Hz Gaming Monitor', 'Nano IPS 1440p gaming display 240Hz', 349.99, 'LG', 1, 28, 'https://www.lg.com/uk/business/images/product/md05u-1.1-derived.jpg', 4.9, 234, true, true, NOW(), NOW(), 299.99),

-- Fashion - AUTHENTIC CLOTHING IMAGES
('Levi''s 501 Original Fit Jeans Men Blue', 'Classic denim jeans with timeless style', 79.99, 'Levi''s', 2, 100, 'https://images.levi.com/is/image/LeviStrauss/medium_blue-medium-blue-00501-1194.jpg', 4.7, 289, true, true, NOW(), NOW(), 69.99),
('Nike Air Max 90 White/Black/Red', 'Iconic running shoes with Air cushioning', 129.99, 'Nike', 2, 80, 'https://static.nike.com/a/image/t_PDP_1296x1296,f_auto,q_auto:eco/29de0c17-8bce-437f-9eba-7370acca6fa9/NIKE+AIR+MAX+90.png', 4.8, 567, true, true, NOW(), NOW(), 99.99),
('Adidas Ultraboost 22 Running Shoes', 'High-performance running sneaker with boost', 189.99, 'Adidas', 2, 70, 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8ea578f142c4452a82aaad7500abcdef_9366/Ultraboost_22_Shoes_Black_GX5923_01_standard.jpg', 4.7, 423, true, true, NOW(), NOW(), 149.99),
('Gap Women''s Cashmere Sweater Gray', 'Premium cashmere crewneck sweater', 149.99, 'Gap', 2, 55, 'https://www.gapcdn.com/webcontent/0000/372/898/cn372898_330x330.jpg', 4.8, 234, true, false, NOW(), NOW(), 119.99),
('Ray-Ban Aviator Sunglasses RB3025', 'Classic pilots style sunglasses with UV protection', 169.99, 'Ray-Ban', 2, 80, 'https://www.ray-ban.com/usa/en_US/RB3025-gold/8053672572725.png', 4.9, 789, true, true, NOW(), NOW(), 139.99),
('Jordan 1 Retro High OG Chicago', 'Legendary basketball shoe silhouette', 179.99, 'Jordan', 2, 48, 'https://static.nike.com/a/image/t_PDP_1296x1296,f_auto,q_auto:eco/3bd1efb7-ea0a-424f-a5a6-9e0cd738e85c/AIR+JORDAN+1+RETRO+HIGH+OG.png', 4.9, 456, true, true, NOW(), NOW(), 149.99),
('Zara Woman Black Tailored Blazer', 'Modern fitted blazer for professional styling', 119.99, 'Zara', 2, 85, 'https://static.zara.net/photos///2023/I/0/1/p/3444/363/040/2/w/1920/3444363040_1_1_1.jpg', 4.7, 178, true, false, NOW(), NOW(), 89.99),
('H&M Women''s Midi Wrap Dress', 'Comfortable wrap dress in vibrant colors', 59.99, 'H&M', 2, 95, 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F8c%2F6c%2F8c6cfa42a52f234a60f3e49cdfc64aba0b4a7833.jpg%5D%2Corigin%5B dam%5D%2Ccategory%5B%5D%2Ctype%5Blookbook%5D&call=url%3Awww.hm.com%3A/en_us/productpage', 4.5, 267, true, true, NOW(), NOW(), 39.99),
('Timberland 6-Inch Premium Boots Brown', 'Waterproof work boots with comfort', 189.99, 'Timberland', 2, 52, 'https://images.timberland.com/is/image/timberland/A1VJH_1_1?$PDP_HERO$', 4.8, 345, true, false, NOW(), NOW(), 149.99),
('Fossil Gen 6 Smartwatch Black Leather', 'Stylish smartwatch with fitness tracking', 249.99, 'Fossil', 2, 40, 'https://www.fossil.com/on/demandware.static/Sites-fossil-us-Site/-/Library-Sites-fossil-us/en_US/dw42d2e825/Original/fossil-ftw4059-generation-6-smartwatch-600.jpg', 4.5, 198, true, false, NOW(), NOW(), 199.99),
('Puma RS-X Sneakers White', 'Retro-inspired casual sports sneaker', 99.99, 'Puma', 2, 70, 'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/374568/01-PNA-hover-web', 4.6, 234, true, true, NOW(), NOW(), 79.99),
('ASOS Design Women''s Mini Dress Yellow', 'On-trend mini dress for parties and nights out', 59.99, 'ASOS', 2, 90, 'https://images.asos-media.com/products/asos-design-mini-dress-in-yellow/201234567/image1.jpg', 4.4, 156, true, true, NOW(), NOW(), 39.99),
('New Balance 990v6 Running Shoes Gray', 'Premium American-made running shoe', 199.99, 'New Balance', 2, 45, 'https://nb.scene7.com/is/image/NB/m990gl6_nb_02_i?$pdpflexf$&wid=880&fit=constrain', 4.8, 289, true, true, NOW(), NOW(), 159.99),
('Columbia Women''s Winter Parka Blue', 'Insulated waterproof winter jacket', 249.99, 'Columbia', 2, 35, 'https://images.columbia.com/is/image/columbiaouterwear/product-image-DV1272?wid=484&fit=constrain', 4.7, 145, true, true, NOW(), NOW(), 199.99),
('Converse Chuck Taylor All Star Black', 'Classic canvas sneaker in multiple colors', 59.99, 'Converse', 2, 120, 'https://www.converse.com/dw/image/v2/BJLZ_PRD/on/demandware.static/-/Sites-converse-master-catalog/default/dw5e96c5dd/images/a_107/M9160_1.jpg', 4.7, 567, true, true, NOW(), NOW(), 45.99),

-- Home & Garden - AUTHENTIC KITCHEN/HOME IMAGES
('Dyson V15 Detect Vacuum Cleaner', 'Cordless vacuum with laser dust detection', 749.99, 'Dyson', 3, 20, 'https://www.dyson.com/medias/?context=bWFzdGVyfGltYWdlc3w0NzQ3NXxpbWFnZS9qcGVnfGltYWdlcy9oZGEvaGQ1LzkyMjY1MjU2NDYxMTAvVjE1X0ZMVUZmeV9QVA', 4.8, 234, true, true, NOW(), NOW(), 649.99),
('Instant Pot Duo Plus 6QT', 'Multi-use electric pressure cooker and slow cooker', 129.99, 'Instant Pot', 3, 45, 'https://www.instantpot.com/sites/default/files/IP-LUX80v3-PIC-1920.png', 4.9, 1289, true, true, NOW(), NOW(), 99.99),
('KitchenAid 5-Quart Stand Mixer Red', 'Professional stand mixer for baking', 449.99, 'KitchenAid', 3, 30, 'https://www.kitchenaid.com/on/demandware.static/-/Sites-KitchenAid-Library/default/d8a3f8c0/k45ss-hero.jpg', 4.9, 567, true, true, NOW(), NOW(), 349.99),
('Vitamix 5300 Blender Black', 'Premium high-powered blender for smoothies', 449.99, 'Vitamix', 3, 25, 'https://www.vitamix.com/on/demandware.static/Sites-Vitamix-Library/default/d8f9e8/5300-black-hero.jpg', 4.8, 434, true, true, NOW(), NOW(), 349.99),
('Ninja XXL Air Fryer Oven', 'Large capacity air fryer for families', 169.99, 'Ninja', 3, 40, 'https://www.ninjakitchen.com/on/demandware.static/Sites-Ninja-Library/default/d5f3e8/air-fryer-xxl.jpg', 4.7, 289, true, true, NOW(), NOW(), 129.99),
('Breville Smart Grind Burr Coffee Maker', 'Automatic grinding coffee maker with precision', 249.99, 'Breville', 3, 35, 'https://www.brevilleusa.com/on/demandware.static/Sites-Breville-Library/default/dwc4a6b9/bmg820bss.jpg', 4.7, 178, true, true, NOW(), NOW(), 199.99),
('Le Creuset 5.5QT Dutch Oven Orange', 'Enameled cast iron cookware for versatility', 399.99, 'Le Creuset', 3, 28, 'https://www.lecreuset.com.au/media/catalog/product/cache/image/600x600/e9df36f33095a17084f85f27a0287e18/0/2/021500140_1.jpg', 4.9, 345, true, true, NOW(), NOW(), 299.99),
('Nespresso Vertuo Coffee Maker Chrome', 'Automatic espresso and coffee machine', 249.99, 'Nespresso', 3, 32, 'https://www.nespresso.com/eservice/medias/sys_master/root/h7d/h3b/8799999541278.png', 4.6, 223, true, false, NOW(), NOW(), 199.99),
('Calphalon Non-Stick Cookware Set 10pc', 'Durable non-stick cookware set', 89.99, 'Calphalon', 3, 50, 'https://www.calphalon.com/en-us/products/cookware-sets/classic-10pc-cookware-set', 4.5, 267, true, true, NOW(), NOW(), 69.99),
('Bamboo Cutting Board Set 3-Piece', 'Eco-friendly cutting boards with handle', 34.99, 'EcoFresh', 3, 75, 'https://images-na.ssl-images-amazon.com/images/I/81ZvZwG0xNL._AC_SX679_.jpg', 4.6, 156, true, false, NOW(), NOW(), 24.99),
('Smart WiFi Thermostat Pro', 'Energy-saving programmable thermostat', 249.99, 'Ecobee', 3, 32, 'https://www.ecobee.com/wp-content/uploads/2021/02/Ecobee-SmartThermostat-4.png', 4.7, 289, true, true, NOW(), NOW(), 199.99),
('Levoit Air Purifier HEPA Filter', 'Quiet air purifier with HEPA filtration', 99.99, 'Levoit', 3, 60, 'https://www.levoit.com/cdn/shop/products/core-mini-featured.jpg', 4.6, 567, true, true, NOW(), NOW(), 79.99),
('Luxury Blackout Curtain Panels Pair', 'Thermal insulated blackout curtains', 69.99, 'Sunbrella', 3, 88, 'https://www.sunbrella.com/en-us/products/sunbrella-outdoor-curtains-spectrum-carbon', 4.5, 145, true, true, NOW(), NOW(), 49.99),
('Egyptian Cotton Bed Sheet Set 1000TC', 'Premium 4-piece luxury bedding set', 129.99, 'Linenspa', 3, 65, 'https://www.linenspa.com/cdn/shop/products/Linenspa_Egyptian_Cotton_Sheet_Set.jpg', 4.8, 234, true, true, NOW(), NOW(), 99.99),
('Philips Hue Smart Light Bulb Starter Kit', 'Color-changing smart LED lighting system', 199.99, 'Philips', 3, 42, 'https://www.philipshue.com/en-us/p/hue-white-and-color-ambiance-a19-led-smart-bulb-starter-kit/046677560789', 4.7, 467, true, true, NOW(), NOW(), 159.99),

-- Sports - AUTHENTIC SPORTS EQUIPMENT IMAGES
('Yoga Mat Premium TPE 6mm Thick', 'Non-slip eco-friendly yoga mat with carrying strap', 79.99, 'FitnessPro', 4, 50, 'https://www.fitnesspro.com/cdn/shop/products/yoga-mat-tpe.jpg', 4.8, 456, true, true, NOW(), NOW(), 59.99),
('Adjustable Dumbbell Set 5-50 lbs', 'Space-saving weights for home gym', 349.99, 'FitnessPro', 4, 25, 'https://www.fitnesspro.com/cdn/shop/products/adjustable-dumbbells-set.jpg', 4.9, 789, true, true, NOW(), NOW(), 299.99),
('Resistance Band Set 5-Piece Latex', 'Color-coded resistance loop bands set', 29.99, 'PowerPlay', 4, 110, 'https://www.powerplay.com/cdn/shop/products/resistance-bands.jpg', 4.7, 234, true, true, NOW(), NOW(), 19.99),
('Peloton Bike+ Digital Fitness', 'Interactive home cycling bike with screen', 1995.00, 'Peloton', 4, 8, 'https://www.onepeloton.com/media/a35a5e47-45a0-4a3b-8b76-82ac8da76f39.jpg', 4.8, 345, true, true, NOW(), NOW(), 1695.00),
('NordicTrack T Series Treadmill', 'Folding electric treadmill with incline', 799.99, 'NordicTrack', 4, 12, 'https://www.nordictrack.com/media/treadmill-t-series.jpg', 4.6, 178, true, true, NOW(), NOW(), 699.99),
('Doorway Pull-Up Bar Multi-Grip', 'Portable strength training pull-up bar', 34.99, 'SportGear', 4, 95, 'https://www.sportgear.com/cdn/shop/products/pullup-bar.jpg', 4.6, 289, true, true, NOW(), NOW(), 24.99),
('Speed Jump Rope With Counter', 'Ball bearing professional jump rope', 19.99, 'SportGear', 4, 145, 'https://www.sportgear.com/cdn/shop/products/jump-rope.jpg', 4.5, 134, true, true, NOW(), NOW(), 14.99),
('Cast Iron Kettlebell 35 lbs', 'Solid cast iron kettlebell weight', 49.99, 'Rogue', 4, 55, 'https://www.roguefitness.com/cdn/shop/products/kettlebell-35lb.jpg', 4.8, 267, true, true, NOW(), NOW(), 39.99),
('High-Density Foam Roller 12x6in', 'Muscle recovery and trigger point massage', 34.99, 'Trigger', 4, 82, 'https://www.trigger.com/cdn/shop/products/foam-roller.jpg', 4.7, 456, true, true, NOW(), NOW(), 24.99),
('Stainless Steel Shaker Bottle 28oz', 'Protein shaker with mixing ball', 24.99, 'Blender Bottle', 4, 120, 'https://www.blenderbottle.com/cdn/shop/products/shaker-bottle.jpg', 4.6, 178, true, true, NOW(), NOW(), 17.99),
('Under Armour Duffel Gym Bag Large', 'Waterproof sports gear duffle bag', 59.99, 'Under Armour', 4, 68, 'https://www.underarmour.com/en-us/p/bags/duffel/5054959.html', 4.7, 234, true, true, NOW(), NOW(), 44.99),
('JBL Endurance Sport Wireless Earbuds', 'Waterproof sports earbuds with earmold', 99.99, 'JBL', 4, 72, 'https://www.jblpro.com/en-US/product/jbl-endurance-sport/e3d8c56d-dc9d-4b92-adc0-2d0e7a8b9c7f', 4.6, 289, true, true, NOW(), NOW(), 79.99),
('Garmin Forerunner 255 Smartwatch', 'GPS running watch with training metrics', 299.99, 'Garmin', 4, 45, 'https://www.garmin.com/en-US/p/prod724411/pimg/unit/en/c960x540', 4.8, 345, true, true, NOW(), NOW(), 249.99),
('Compression Clothing Set Active Wear', 'Moisture-wicking compression sports set', 79.99, 'Skins', 4, 35, 'https://www.skins.net/cdn/shop/products/compression-set.jpg', 4.5, 156, true, false, NOW(), NOW(), 59.99),
('Tactical Gym Bag 50L Rucksack', 'Military-style tactical training gear bag', 149.99, 'LAPG', 4, 28, 'https://www.lapolicegear.com/cdn/shop/products/tactical-bag.jpg', 4.6, 89, true, false, NOW(), NOW(), 119.99),

-- Books - REAL BOOK COVER IMAGES FROM AMAZON
('The Midnight Library', 'Contemporary fiction bestseller by Matt Haig', 16.99, 'Matt Haig', 5, 75, 'https://images-na.ssl-images-amazon.com/images/P/B089PV9DLN.01.L.jpg', 4.6, 234, true, false, NOW(), NOW(), 12.99),
('Atomic Habits', 'Best-selling self-improvement and habits book', 18.99, 'James Clear', 5, 60, 'https://images-na.ssl-images-amazon.com/images/P/B01N5AX61D.01.L.jpg', 4.8, 567, true, true, NOW(), NOW(), 14.99),
('1984', 'Classic dystopian novel by George Orwell', 13.99, 'George Orwell', 5, 85, 'https://images-na.ssl-images-amazon.com/images/P/0451524934.01.L.jpg', 4.7, 345, true, false, NOW(), NOW(), 10.99),
('The Great Gatsby', 'American classic literature masterpiece', 12.99, 'F. Scott Fitzgerald', 5, 90, 'https://images-na.ssl-images-amazon.com/images/P/0743273567.01.L.jpg', 4.8, 456, true, true, NOW(), NOW(), 9.99),
('The Hobbit', 'Fantasy adventure classic by J.R.R. Tolkien', 14.99, 'J.R.R. Tolkien', 5, 85, 'https://images-na.ssl-images-amazon.com/images/P/0547928211.01.L.jpg', 4.9, 678, true, true, NOW(), NOW(), 11.99),
('Dune', 'Epic science fiction masterpiece by Frank Herbert', 17.99, 'Frank Herbert', 5, 70, 'https://images-na.ssl-images-amazon.com/images/P/0441172717.01.L.jpg', 4.7, 289, true, true, NOW(), NOW(), 13.99),
('To Kill a Mockingbird', 'American literary classic by Harper Lee', 13.99, 'Harper Lee', 5, 95, 'https://images-na.ssl-images-amazon.com/images/P/0061120081.01.L.jpg', 4.9, 734, true, true, NOW(), NOW(), 10.99),
('The Catcher in the Rye', 'Coming of age novel by J.D. Salinger', 14.99, 'J.D. Salinger', 5, 75, 'https://images-na.ssl-images-amazon.com/images/P/0316769174.01.L.jpg', 4.5, 178, true, false, NOW(), NOW(), 11.99),
('Sapiens', 'History of humankind by Yuval Noah Harari', 19.99, 'Yuval Noah Harari', 5, 62, 'https://images-na.ssl-images-amazon.com/images/P/0062316095.01.L.jpg', 4.8, 456, true, true, NOW(), NOW(), 15.99),
('Thinking, Fast and Slow', 'Psychology and decision making by Daniel Kahneman', 18.99, 'Daniel Kahneman', 5, 58, 'https://images-na.ssl-images-amazon.com/images/P/0374533555.01.L.jpg', 4.7, 234, true, true, NOW(), NOW(), 14.99);
