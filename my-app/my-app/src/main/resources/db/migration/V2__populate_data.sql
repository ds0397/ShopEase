-- Sample data for the 'users' table
INSERT INTO users (first_name, last_name, age, gender, contact, is_prime_customer)
VALUES
("John", "Doe", 30, "Male", 12345678, 1),
("Jane", "Smith", 25, "Female", 987654210, 0),
("Alice", "Johnson", 28, "Female", 789023456, 1),
("Michael", "Brown", 35, "Male", 555555555, 1),
("Emily", "Davis", 22, "Female", 999999999, 0),
("David", "Wilson", 45, "Male", 77777777, 1),
("Sophia", "Lee", 27, "Female", 8888888, 0);

-- Sample data for the 'city' table
INSERT INTO city (name)
VALUES
("New York"),
("Los Angeles"),
("Chicago"),
("Houston"),
("Philadelphia"),
("Phoenix"),
("San Antonio");

-- Sample data for the 'state' table
INSERT INTO state (name)
VALUES
("New York"),
("California"),
("Illinois"),
("Texas"),
("Pennsylvania"),
("Arizona"),
("Florida");

-- Sample data for the 'address' table
INSERT INTO address (line_1, line_2, pincode, landmark, city_id, state_id)
VALUES
("123 Main St", "Apt 4B", 10001, "Central Park", 1, 1),
("456 Elm St", "Unit 302", 90001, "Beachfront", 2, 2),
("789 Oak St", "Suite 101", 60601, "Downtown", 3, 3),
("101 Pine St", "Unit 201", 77001, "Riverfront", 4, 4),
("222 Walnut St", "Apt 3C", 19101, "Historic District", 5, 5),
("333 Maple St", "Apt 101", 85001, "Mountain View", 6, 6),
("444 Cedar St", "Unit 202", 33001, "Lakefront", 7, 7);

-- Sample data for the 'address_mapping' table (mapping users to addresses)
INSERT INTO address_mapping (user_id, address_id)
VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 4),
(1, 3),
(2, 4),
(3, 5),
(4, 6),
(5, 7),
(6, 1),
(7, 2);

-- Sample data for the 'card_details' table
INSERT INTO card_details (TYPE, card_number, expiry)
VALUES
("Visa", 123456786, '2025-12-31'),
("Mastercard", 987654654, '2026-11-30'),
("American Express", 3456346, '2025-10-31'),
("Discover", 7654754, '2025-09-30'),
("Diners Club", 98769876, '2025-08-31');


-- Sample data for the 'user_card_mapping' table
INSERT INTO user_card_mapping (user_id, card_id)
VALUES
(1, 2),
(2, 3),
(3, 4),
(5, 4);

-- Sample data for the 'product_category' table
INSERT INTO product_category (TYPE)
VALUES
('Electronics'),
('Clothing'),
('Home & Kitchen'),
('Toys & Games'),
('Books');

-- Sample data for the 'products' table
INSERT INTO products (category_id, name, avg_rating)
VALUES
(1, 'Smartphone X', 4.5),
(2, 'Men''s T-Shirt', 4.2),
(3, 'Kitchen Appliance Set', 4.6),
(4, 'Action Figure Toy', 4.0),
(5, 'Science Fiction Novel', 4.8);

-- Sample data for the 'user_feedback' table
INSERT INTO user_feedback (product_id, user_id, rating, comments)
VALUES
(1, 1, 4, 'Great smartphone!'),
(1, 2, 5, 'Fast delivery, excellent product'),
(2, 3, 4, 'High-quality fabric, comfortable'),
(2, 4, 3, 'Nice design but a bit tight'),
(3, 5, 5, 'Fantastic cooking set, highly recommended'),
(3, 6, 4, 'Cooking made easy with these appliances'),
(4, 7, 5, 'Fun toy for kids, great entertainment'),
(4, 2, 4, 'Good value for the price'),
(5, 1, 5, 'Captivating story, couldnt put it down'),
(5, 6, 4, 'Interesting plot and characters');

-- Sample data for the 'image_mapping' table
INSERT INTO image_mapping (product_id, image_url)
VALUES
(1, 'image1.jpg'),
(1, 'image2.jpg'),
(2, 'image3.jpg'),
(2, 'image4.jpg'),
(3, 'image5.jpg'),
(3, 'image6.jpg'),
(4, 'image7.jpg'),
(4, 'image8.jpg'),
(5, 'image9.jpg'),
(5, 'image10.jpg');









-- Sample data for the 'variation' table
INSERT INTO variation (TYPE)
VALUES
("Color"),
("Size"),
("Material"),
("Style"),
("Weight");

-- Sample data for the 'product_variation' table
INSERT INTO product_variation (product_id, variation_id)
VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 2),
(3, 4),
(4, 1),
(4, 5),
(5, 3),
(5, 4);



-- Sample data for the 'variation_value' table
INSERT INTO variation_value (product_variation_id, value)
VALUES
(1, "Red"),
(1, "Blue"),
(2, "Small"),
(2, "Large"),
(3, "Wood"),
(3, "Metal"),
(4, "Modern"),
(4, "Vintage"),
(5, "Light"),
(5, "Heavy");




-- Sample data for the 'merchants' table
INSERT INTO merchants (name, gstin)
VALUES
("Merchant A", 12345690),
("Merchant B", 98763210),
("Merchant C", 34345634),
("Merchant D", 76765476),
("Merchant E", 98987698);

-- Sample data for the 'merchant_product_mapping' table
INSERT INTO merchant_product_mapping (merchant_id, product_id, stock_available, price)
VALUES
(1, 1, 100, 499.99),
(2, 2, 50, 799.99),
(3, 3, 75, 299.99),
(4, 4, 60, 899.99),
(5, 5, 120, 199.99);



-- Sample data for the 'delivery_agency' table
INSERT INTO delivery_agency (name, helpline_no)
VALUES
("Agency A", 11111111),
("Agency B", 22222222),
("Agency C", 33333333),
("Agency D", 44444444),
("Agency E", 55555555);



-- Sample data for the 'shipping' table
INSERT INTO shipping (address_id, status, delivery_agency_id)
VALUES
(1, 1, 1),
(2, 0, 2),
(3, 1, 3),
(4, 1, 4),
(5, 0, 5),
(6, 1, 2),
(7, 1, 4);


-- Sample data for the 'orders' table
INSERT INTO orders (user_id, product_id, order_date, price, merchant_id, payment_method, quantity, shipping_id)
VALUES
(1, 1, '2023-10-15', 499.99, 1, 1, 2, 1),
(2, 2, '2023-10-16', 799.99, 2, 2, 3, 2),
(3, 3, '2023-10-17', 299.99, 3, 1, 1, 3),
(4, 4, '2023-10-18', 899.99, 4, 2, 4, 4),
(5, 5, '2023-10-19', 199.99, 5, 1, 3, 5),
(1, 2, '2023-10-20', 699.99, 1, 2, 1, 6),
(2, 3, '2023-10-21', 399.99, 2, 1, 2, 7);


-- Sample data for the 'order_user_mapping' table
INSERT INTO order_user_mapping (order_id, user_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 3),
(5, 5),
(6, 1),
(7, 2),
(1, 3),
(4, 4),
(7, 5);
