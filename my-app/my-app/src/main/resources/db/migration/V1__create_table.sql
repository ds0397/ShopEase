


CREATE TABLE users (
    id INT  AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age BIGINT,
    gender VARCHAR(10),
    contact INT,
    is_prime_customer BOOLEAN
);

CREATE TABLE city (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE state (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);
CREATE TABLE address (
    id INT AUTO_INCREMENT PRIMARY KEY,
    line_1 VARCHAR(50),
    line_2 VARCHAR(50),
    pincode INT NOT NULL,
    landmark VARCHAR(50),
    city_id INT NOT NULL,
    state_id INT NOT NULL,
    FOREIGN KEY (city_id)
        REFERENCES city (id),
    FOREIGN KEY (state_id)
        REFERENCES state (id)
);


CREATE TABLE address_mapping (
    user_id INT,
    address_id INT,
    FOREIGN KEY (user_id)
        REFERENCES users (id),
    FOREIGN KEY (address_id)
        REFERENCES address (id),
    PRIMARY KEY (user_id , address_id)
);


CREATE TABLE card_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    TYPE VARCHAR(25),
    card_number INT NOT NULL,
    expiry DATE NOT NULL
);


CREATE TABLE user_card_mapping (
    user_id INT,
    card_id INT,
    PRIMARY KEY (user_id , card_id),
    FOREIGN KEY (user_id)
        REFERENCES users (id),
    FOREIGN KEY (card_id)
        REFERENCES card_details (id)
);


CREATE TABLE product_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    TYPE VARCHAR(25)
);


CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    name VARCHAR(50),
    avg_rating FLOAT4,
    FOREIGN KEY (category_id)
        REFERENCES product_category (id)
);


CREATE TABLE user_feedback (
    product_id INT NOT NULL,
    user_id INT NOT NULL,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comments VARCHAR(200),
    FOREIGN KEY (product_id)
        REFERENCES products (id),
    FOREIGN KEY (user_id)
        REFERENCES users (id),
    PRIMARY KEY (product_id , user_id)
);


CREATE TABLE image_mapping (
    product_id INT,
    image_url VARCHAR(50),
    FOREIGN KEY (product_id)
        REFERENCES products (id),
    PRIMARY KEY (product_id , image_url)
);


CREATE TABLE variation (
    id INT auto_increment PRIMARY KEY,
    TYPE VARCHAR(25)
);


CREATE TABLE product_variation (
    product_variation_id INT AUTO_INCREMENT,
    product_id INT,
    variation_id INT,
    FOREIGN KEY (product_id)
        REFERENCES products (id),
    FOREIGN KEY (variation_id)
        REFERENCES variation (id),
    PRIMARY KEY (product_variation_id , product_id)
);


CREATE TABLE variation_value (
    product_variation_id INT,
    value VARCHAR(25),
    FOREIGN KEY (product_variation_id)
        REFERENCES product_variation (product_variation_id),
    PRIMARY KEY (product_variation_id , value)
);


CREATE TABLE merchants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    gstin INT
);


CREATE TABLE merchant_product_mapping (
    merchant_id INT,
    product_id INT,
    stock_available INT NOT NULL,
    price FLOAT4 NOT NULL,
    FOREIGN KEY (merchant_id)
        REFERENCES merchants (id),
    FOREIGN KEY (product_id)
        REFERENCES products (id),
    PRIMARY KEY (merchant_id , product_id)
);


CREATE TABLE delivery_agency (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    helpline_no INT
);


CREATE TABLE shipping (
    id INT AUTO_INCREMENT,
    address_id INT,
    status BOOLEAN,
    delivery_agency_id INT,
    FOREIGN KEY (address_id)
        REFERENCES address (id),
    FOREIGN KEY (delivery_agency_id)
        REFERENCES delivery_agency (id),
    PRIMARY KEY (id , address_id)
);


CREATE TABLE orders (
    id INT AUTO_INCREMENT,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    order_date DATE,
    price INT NOT NULL,
    merchant_id INT,
    payment_method INT,
    quantity INT,
    shipping_id INT,
    FOREIGN KEY (user_id)
        REFERENCES users (id),
    FOREIGN KEY (product_id)
        REFERENCES products (id),
    FOREIGN KEY (merchant_id)
        REFERENCES merchants (id),
    FOREIGN KEY (payment_method)
        REFERENCES card_details (id),
    FOREIGN KEY (shipping_id)
        REFERENCES shipping (id),
    PRIMARY KEY (id , user_id)
);


CREATE TABLE order_user_mapping (
    order_id INT,
    user_id INT,
    FOREIGN KEY (order_id)
        REFERENCES orders (id),
    FOREIGN KEY (user_id)
        REFERENCES users (id),
    PRIMARY KEY (user_id , order_id)
);



desc orders