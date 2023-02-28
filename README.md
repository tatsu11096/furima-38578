
# README

## Usersテーブル

|Column|Type|Options|
|nickname|string|null:false|
|email|string|null:false,unique: true|
|encrypted_password|string|null:false|
|last_name|string|null:false|
|first_name|string|null:false|
|last_name_kana|string|null:false|
|first_name_kana|string|null:false|
|birth_year|string|null:false|
|birth_month|string|null:false|
|birth_day|string|null:false|


has_many:items
has_many:orders


## orderテーブル

|Column|Type|Options|
|user_id|references|null:false|
|items_id|references|null:false|
belongs_to:user
belongs_to:item
has_one:delivery

## deliveryテーブル

|Column|Type|Options|
|zip_code|string|null:false|
|prefecture|string|null:false|
|city|string|null:false|
|city_address|string|null:false|
|building|string|null:false|
|telephone|string|null:false|
|user_id|reference|null:false|
|orders_id|references|null:false|

belongs_to_order


## itemsテーブル

|Column|Type|Options|
|picture|string|null:false|
|name|string|null:false|
|message|text|null:false|
|category_id|string|null:false|
|condition|string|null:false|
|shipping_charges|string|null:false|
|shipping_region|string|null:false|
|shipping_date|string|null:false|
|price|integer|null:false|
|user_id|references|null:false,foreign_key: true|

belongs_to_user
has_one:order



### Association

（ここに追記していく）
