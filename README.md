# README

## Usersテーブル

|Column|Type|Options|
|email|string|null:false,unique: true|
|nickname|string|null:false,unique: true|
|password|string|null:false,unique: true|
has_many:items
has_many:orders

## Profileテーブル

|Column|Type|Options|
|last_name|string|null:false|
|first_name|string|null:false|
|last_name_kana|string|null:false|
|first_name_kana|string|null:false|
|birth_year|string|null:false|
|birth_month|string|null:false|
|birth_day|string|null:false|
|zip_code|string|null:false|
|prefecture|string|null:false|
|city|string|null:false|
|city_address|string|null:false|
|building|date|null:fa|
|User_id|references|null:false|

## Credit_cardテーブル

|Column|Type|Options|
|id|string|null:false|
|token_login_login|string|null:false|
|User_id|string|null:false|
belongs_to_users


## orderテーブル

|Column|Type|Options|
|name|string|null:false|
|date|string|null:false|
|address|string|null:false|
|buyer|string|null:false|
|credit_token|string|null:false|
|zip_code|string|null:false|
|prefecture|string|null:false|
|city|string|null:false|
|city_address|string|null:false|
|building|string|null:false|
|telephone|string|null:false|
|belongs_to:items|string|null:false|


belongs_to_user
belongs_to:item
has_one:delivery

## itemsテーブル

|Column|Type|Options|
|name|string|null:false|
|category_id|string|null:false|
|message|text|null:false|
|seller|string|null:false|
|picture|string|null:false|
|shipping_date|string|null:false|
|shipping_region|integer|null:false|
|shipping_charges|integer|null:false|
|price|integer|null:false|
|condition|string|null:false|
|user_id|references|null:false,foreign_key: true|

belongs_to_user
has_one:order

## deliveryテーブル

|name|string|null:false|
|zip_code|string|null:false|
|prefecture|string|null:false|
|city|string|null:false|
|city_address|string|null:false|
|building|string|null:false|
|telephone|string|null:false|
|order_id|references|null: false, foreign_key: true|

belongs_to:order


### Association
（ここに追記していく）