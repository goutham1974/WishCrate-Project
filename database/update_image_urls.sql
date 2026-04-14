-- Migration: Update all product image URLs from via.placeholder.com to placehold.co

-- Electronics products
UPDATE products SET image_url = 'https://placehold.co/400x400/1f1f1f/ffffff?text=iPhone+15' WHERE name = 'Apple iPhone 15 Pro Max 256GB';
UPDATE products SET image_url = 'https://placehold.co/400x400/1a73e8/ffffff?text=Galaxy+S24' WHERE name = 'Samsung Galaxy S24 Ultra 512GB';
UPDATE products SET image_url = 'https://placehold.co/400x400/2c2c2c/ffffff?text=MacBook+Pro' WHERE name LIKE 'MacBook Pro%';
UPDATE products SET image_url = 'https://placehold.co/400x400/000000/ffffff?text=Sony+Headphones' WHERE name = 'Sony WH-1000XM5 Black';
UPDATE products SET image_url = 'https://placehold.co/400x400/3a6ea5/ffffff?text=iPad+Pro' WHERE name LIKE 'iPad Pro%';
UPDATE products SET image_url = 'https://placehold.co/400x400/4285f4/ffffff?text=Pixel+8+Pro' WHERE name LIKE 'Google Pixel%';
UPDATE products SET image_url = 'https://placehold.co/400x400/004099/ffffff?text=Dell+XPS' WHERE name LIKE 'Dell XPS%';
UPDATE products SET image_url = 'https://placehold.co/400x400/002d5c/ffffff?text=Samsung+TV' WHERE name LIKE 'Samsung 55%';
UPDATE products SET image_url = 'https://placehold.co/400x400/ffffff/000000?text=AirPods+Pro' WHERE name = 'Apple AirPods Pro (2nd Gen)';
UPDATE products SET image_url = 'https://placehold.co/400x400/f1f1f1/222222?text=Canon+Camera' WHERE name LIKE 'Canon EOS%';
UPDATE products SET image_url = 'https://placehold.co/400x400/e60012/ffffff?text=Switch+OLED' WHERE name = 'Nintendo Switch OLED White';
UPDATE products SET image_url = 'https://placehold.co/400x400/003087/ffffff?text=PlayStation+5' WHERE name = 'PlayStation 5 Disc Edition';
UPDATE products SET image_url = 'https://placehold.co/400x400/333333/ffffff?text=DJI+Drone' WHERE name = 'DJI Air 3S Drone';
UPDATE products SET image_url = 'https://placehold.co/400x400/1a1a1a/ffffff?text=Bose+Ultra' WHERE name = 'Bose QuietComfort Ultra Headphones';
UPDATE products SET image_url = 'https://placehold.co/400x400/3c3c3c/00ff00?text=LG+Monitor' WHERE name LIKE 'LG 27%';

-- Fashion products
UPDATE products SET image_url = 'https://placehold.co/400x400/1a3a5c/ffffff?text=Levi''s+Jeans' WHERE name LIKE 'Levi''s%';
UPDATE products SET image_url = 'https://placehold.co/400x400/111111/ffffff?text=Nike+Shoes' WHERE name = 'Nike Air Max 90 White/Black/Red';
UPDATE products SET image_url = 'https://placehold.co/400x400/000000/ffffff?text=Adidas+Boost' WHERE name = 'Adidas Ultraboost 22 Running Shoes';
UPDATE products SET image_url = 'https://placehold.co/400x400/808080/ffffff?text=Gap+Sweater' WHERE name LIKE 'Gap Women%';
UPDATE products SET image_url = 'https://placehold.co/400x400/2c2c2c/ffcc00?text=Ray+Ban' WHERE name = 'Ray-Ban Aviator Sunglasses RB3025';
UPDATE products SET image_url = 'https://placehold.co/400x400/ce1141/ffffff?text=Jordan+1' WHERE name = 'Jordan 1 Retro High OG Chicago';
UPDATE products SET image_url = 'https://placehold.co/400x400/1a1a1a/ffffff?text=Zara+Blazer' WHERE name = 'Zara Woman Black Tailored Blazer';
UPDATE products SET image_url = 'https://placehold.co/400x400/ff6b00/ffffff?text=HM+Dress' WHERE name LIKE 'H&M%';
UPDATE products SET image_url = 'https://placehold.co/400x400/5c4033/ffffff?text=Timberland' WHERE name = 'Timberland 6-Inch Premium Boots Brown';
UPDATE products SET image_url = 'https://placehold.co/400x400/4a4a4a/ffffff?text=Fossil+Watch' WHERE name = 'Fossil Gen 6 Smartwatch Black Leather';
UPDATE products SET image_url = 'https://placehold.co/400x400/ffffff/000000?text=Puma+Shoes' WHERE name = 'Puma RS-X Sneakers White';
UPDATE products SET image_url = 'https://placehold.co/400x400/d4af37/000000?text=ASOS+Dress' WHERE name LIKE 'ASOS%';
UPDATE products SET image_url = 'https://placehold.co/400x400/707070/ffffff?text=New+Balance' WHERE name = 'New Balance 990v6 Running Shoes Gray';
UPDATE products SET image_url = 'https://placehold.co/400x400/003d7a/ffffff?text=Columbia+Parka' WHERE name = 'Columbia Women''s Winter Parka';
UPDATE products SET image_url = 'https://placehold.co/400x400/000000/ffffff?text=Converse' WHERE name = 'Converse Chuck Taylor All Star Unisex';

-- Home & Garden products
UPDATE products SET image_url = 'https://placehold.co/400x400/ffaa00/000000?text=Dyson+Vacuum' WHERE name = 'Dyson V15 Detect Vacuum Cleaner';
UPDATE products SET image_url = 'https://placehold.co/400x400/ff6600/ffffff?text=Instant+Pot' WHERE name = 'Instant Pot Duo Plus 6QT';
UPDATE products SET image_url = 'https://placehold.co/400x400/cc0000/ffffff?text=KitchenAid' WHERE name = 'KitchenAid 5-Quart Stand Mixer Red';
UPDATE products SET image_url = 'https://placehold.co/400x400/222222/ffffff?text=Vitamix' WHERE name = 'Vitamix 5300 Blender Black';
UPDATE products SET image_url = 'https://placehold.co/400x400/000000/ffffff?text=Ninja+Fryer' WHERE name = 'Ninja XXL Air Fryer Oven';
UPDATE products SET image_url = 'https://placehold.co/400x400/333333/ffffff?text=Breville+Coffee' WHERE name = 'Breville Smart Grind Burr Coffee Maker';
UPDATE products SET image_url = 'https://placehold.co/400x400/ff6600/ffffff?text=Le+Creuset' WHERE name = 'Le Creuset 5.5QT Dutch Oven Orange';
UPDATE products SET image_url = 'https://placehold.co/400x400/888888/000000?text=Nespresso' WHERE name = 'Nespresso Vertuo Coffee Maker Chrome';
UPDATE products SET image_url = 'https://placehold.co/400x400/505050/ffffff?text=Calphalon' WHERE name = 'Calphalon Non-Stick Cookware Set 10pc';
UPDATE products SET image_url = 'https://placehold.co/400x400/8b7355/ffffff?text=Cutting+Board' WHERE name = 'Bamboo Cutting Board Set 3-Piece';
UPDATE products SET image_url = 'https://placehold.co/400x400/2c3e50/ffffff?text=Thermostat' WHERE name = 'Smart WiFi Thermostat Pro';
UPDATE products SET image_url = 'https://placehold.co/400x400/f5f5f5/333333?text=Air+Purifier' WHERE name = 'Levoit Air Purifier HEPA Filter';
UPDATE products SET image_url = 'https://placehold.co/400x400/1a1a1a/ffffff?text=Curtains' WHERE name = 'Luxury Blackout Curtain Panels Pair';
UPDATE products SET image_url = 'https://placehold.co/400x400/e8d5c4/333333?text=Bed+Sheets' WHERE name = 'Egyptian Cotton Bed Sheet Set 1000TC';
UPDATE products SET image_url = 'https://placehold.co/400x400/0d47a1/ffff00?text=Smart+Lights' WHERE name = 'Philips Hue Smart Light Bulb Starter Kit';

-- Sports products
UPDATE products SET image_url = 'https://placehold.co/400x400/9c27b0/ffffff?text=Yoga+Mat' WHERE name = 'Yoga Mat Premium TPE 6mm Thick';
UPDATE products SET image_url = 'https://placehold.co/400x400/424242/ffff00?text=Dumbbells' WHERE name = 'Adjustable Dumbbell Set 5-50 lbs';
UPDATE products SET image_url = 'https://placehold.co/400x400/ff1744/ffffff?text=Resistance' WHERE name = 'Resistance Band Set 5-Piece Latex';
UPDATE products SET image_url = 'https://placehold.co/400x400/1f1f1f/ffffff?text=Peloton+Bike' WHERE name = 'Peloton Bike+ Digital Fitness';
UPDATE products SET image_url = 'https://placehold.co/400x400/333333/ffffff?text=Treadmill' WHERE name = 'NordicTrack T Series Treadmill';
UPDATE products SET image_url = 'https://placehold.co/400x400/555555/ffff00?text=Pull+Up+Bar' WHERE name = 'Doorway Pull-Up Bar Multi-Grip';
UPDATE products SET image_url = 'https://placehold.co/400x400/ff6b00/000000?text=Jump+Rope' WHERE name = 'Speed Jump Rope With Counter';
UPDATE products SET image_url = 'https://placehold.co/400x400/2c2c2c/ffff00?text=Kettlebell' WHERE name = 'Cast Iron Kettlebell 35 lbs';
UPDATE products SET image_url = 'https://placehold.co/400x400/00bcd4/ffffff?text=Foam+Roller' WHERE name = 'High-Density Foam Roller 12x6in';
UPDATE products SET image_url = 'https://placehold.co/400x400/cccccc/333333?text=Shaker' WHERE name = 'Stainless Steel Shaker Bottle 28oz';
UPDATE products SET image_url = 'https://placehold.co/400x400/0c0c0c/ffffff?text=Gym+Bag' WHERE name = 'Under Armour Duffel Gym Bag Large';
UPDATE products SET image_url = 'https://placehold.co/400x400/1a1a1a/ffffff?text=JBL+Earbuds' WHERE name = 'JBL Endurance Sport Wireless Earbuds';
UPDATE products SET image_url = 'https://placehold.co/400x400/3c3c3c/00ff00?text=Garmin+Watch' WHERE name = 'Garmin Forerunner 255 Smartwatch';
UPDATE products SET image_url = 'https://placehold.co/400x400/0d0d0d/ff0000?text=Compression' WHERE name = 'Compression Clothing Set Active Wear';
UPDATE products SET image_url = 'https://placehold.co/400x400/3d3d3d/ffff00?text=Tactical+Bag' WHERE name = 'Tactical Gym Bag 50L Rucksack';

-- Books products
UPDATE products SET image_url = 'https://placehold.co/300x300/4a235a/ffffff?text=Midnight+Library' WHERE name = 'The Midnight Library Book';
UPDATE products SET image_url = 'https://placehold.co/300x300/1a237e/ffffff?text=Atomic+Habits' WHERE name = 'Atomic Habits Book';
UPDATE products SET image_url = 'https://placehold.co/300x300/000000/ffffff?text=1984' WHERE name = '1984 by George Orwell';
UPDATE products SET image_url = 'https://placehold.co/300x300/1b5e20/ccff00?text=Great+Gatsby' WHERE name = 'The Great Gatsby';
UPDATE products SET image_url = 'https://placehold.co/300x300/3e2723/ffcc00?text=Hobbit' WHERE name = 'The Hobbit';
UPDATE products SET image_url = 'https://placehold.co/300x300/ff6f00/ffffff?text=Dune' WHERE name = 'Dune';
UPDATE products SET image_url = 'https://placehold.co/300x300/004d40/ffffff?text=Mockingbird' WHERE name = 'To Kill a Mockingbird';
UPDATE products SET image_url = 'https://placehold.co/300x300/263238/ffffff?text=Catcher' WHERE name = 'The Catcher in the Rye';
UPDATE products SET image_url = 'https://placehold.co/300x300/5e35b1/ffffff?text=Sapiens' WHERE name = 'Sapiens';
UPDATE products SET image_url = 'https://placehold.co/300x300/0277bd/ffffff?text=Thinking' WHERE name = 'Thinking, Fast and Slow';
UPDATE products SET image_url = 'https://placehold.co/300x300/bf360c/ffffff?text=Art+of+War' WHERE name = 'The Art of War';
UPDATE products SET image_url = 'https://placehold.co/300x300/6a1b9a/ffffff?text=Educated' WHERE name = 'Educated';
UPDATE products SET image_url = 'https://placehold.co/300x300/455a64/ffffff?text=Becoming' WHERE name = 'Becoming';
UPDATE products SET image_url = 'https://placehold.co/300x300/e65100/ffffff?text=Alchemist' WHERE name = 'The Alchemist';
UPDATE products SET image_url = 'https://placehold.co/300x300/212121/ffffff?text=Rich+Dad' WHERE name = 'Rich Dad Poor Dad';
