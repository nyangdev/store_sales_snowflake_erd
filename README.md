# Store Sales Snowflake ERD

[Kaggle - Superstore Sales Dataset](https://www.kaggle.com/datasets/rohitsahoo/sales-forecasting/data)을 사용하였으며,  
ERD 다이어그램은 [dbdiagram.io](https://dbdiagram.io/home) 툴을 이용해 작성했습니다.


4년 간의 대형마트 판매 데이터 셋을 다양한 관점에서 매출액을 분석하고자 합니다.

## ERD 다이어그램
<img width="1093" height="1003" alt="snowflake_schema_erd_image" src="https://github.com/user-attachments/assets/45176e0f-fb91-47d8-be70-8b13b9cd09a4" />

--------
```
Table dim_region {
  region_id integer [primary key]
  region_name varchar
}

Table dim_city {
  city_id integer [primary key]
  city_name varchar
  state_name varchar
  region_id integer
}

Table dim_segment {
  segment_id integer [primary key]
  segment_name varchar
}

Table dim_customer {
  customer_id integer [primary key]
  customer_name varchar
  segment_id integer
}

Table dim_category {
  category_id integer [primary key]
  category_name varchar
}

Table dim_subcategory {
  subcategory_id integer [primary key]
  subcategory_name varchar
  category_id integer
}

Table dim_product {
  product_id integer [primary key]
  product_name varchar
  category_id integer
  subcategory_id integer
}

Table dim_orderdate {
  orderdate_id integer [primary key]
  orderdate_when datetime
}

Table fact_order {
  order_id varchar
  sales float
  city_id integer
  customer_id integer
  product_id integer
  orderdate_id integer
  Indexes {
    (order_id, product_id) [pk]
    }
}

Ref: dim_city.region_id > dim_region.region_id
Ref: dim_customer.segment_id > dim_segment.segment_id
Ref: dim_subcategory.category_id > dim_category.category_id

Ref: dim_product.category_id > dim_category.category_id
Ref: dim_product.subcategory_id > dim_subcategory.subcategory_id

Ref: fact_order.city_id > dim_city.city_id
Ref: fact_order.customer_id > dim_customer.customer_id
Ref: fact_order.product_id > dim_product.product_id
Ref: fact_order.orderdate_id > dim_orderdate.orderdate_id
```
