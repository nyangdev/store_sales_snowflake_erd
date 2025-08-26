CREATE TABLE `dim_region` (
  `region_id` integer PRIMARY KEY,
  `region_name` varchar(255)
);

CREATE TABLE `dim_city` (
  `city_id` integer PRIMARY KEY,
  `city_name` varchar(255),
  `state_name` varchar(255),
  `region_id` integer
);

CREATE TABLE `dim_segment` (
  `segment_id` integer PRIMARY KEY,
  `segment_name` varchar(255)
);

CREATE TABLE `dim_customer` (
  `customer_id` integer PRIMARY KEY,
  `customer_name` varchar(255),
  `segment_id` integer
);

CREATE TABLE `dim_category` (
  `category_id` integer PRIMARY KEY,
  `category_name` varchar(255)
);

CREATE TABLE `dim_subcategory` (
  `subcategory_id` integer PRIMARY KEY,
  `subcategory_name` varchar(255),
  `category_id` integer
);

CREATE TABLE `dim_product` (
  `product_id` integer PRIMARY KEY,
  `product_name` varchar(255),
  `category_id` integer,
  `subcategory_id` integer
);

CREATE TABLE `dim_orderdate` (
  `orderdate_id` integer PRIMARY KEY,
  `orderdate_when` datetime
);

CREATE TABLE `fact_order` (
  `order_id` varchar(255),
  `sales` float,
  `city_id` integer,
  `customer_id` integer,
  `product_id` integer,
  `orderdate_id` integer,
  PRIMARY KEY (`order_id`, `product_id`)
);

ALTER TABLE `dim_city` ADD FOREIGN KEY (`region_id`) REFERENCES `dim_region` (`region_id`);

ALTER TABLE `dim_customer` ADD FOREIGN KEY (`segment_id`) REFERENCES `dim_segment` (`segment_id`);

ALTER TABLE `dim_subcategory` ADD FOREIGN KEY (`category_id`) REFERENCES `dim_category` (`category_id`);

ALTER TABLE `dim_product` ADD FOREIGN KEY (`category_id`) REFERENCES `dim_category` (`category_id`);

ALTER TABLE `dim_product` ADD FOREIGN KEY (`subcategory_id`) REFERENCES `dim_subcategory` (`subcategory_id`);

ALTER TABLE `fact_order` ADD FOREIGN KEY (`city_id`) REFERENCES `dim_city` (`city_id`);

ALTER TABLE `fact_order` ADD FOREIGN KEY (`customer_id`) REFERENCES `dim_customer` (`customer_id`);

ALTER TABLE `fact_order` ADD FOREIGN KEY (`product_id`) REFERENCES `dim_product` (`product_id`);

ALTER TABLE `fact_order` ADD FOREIGN KEY (`orderdate_id`) REFERENCES `dim_orderdate` (`orderdate_id`);
