
# README

## Usersテーブル

|Column |Type |Options  |
|nickname          |string|null:false|
|email             |string|null:false,unique: true|
|encrypted_password|string|null:false|
|last_name         |string|null:false|
|first_name        |string|null:false|
|last_name_kana    |string|null:false|
|first_name_kana   |string|null:false|
|birth_day         |date  |null:false|

### Association

has_many:items
has_many:orders

## ordersテーブル

|Column|Type|Options|
|user|references|null:false,foreign_key: true|
|item|references|null:false,foreign_key: true|

### Association

belongs_to:user
belongs_to:item
has_one:delivery

## deliveriesテーブル

|Column|Type|Options|
|zip_code          |string    |null:false|
|shipping_region_id|integer   |null:false|
|city              |string    |null:false|
|city_address      |string    |null:false|
|building          |string    |
|telephone         |string    |null:false|
|order             |references|null:false,foreign_key: true|

### Association

belongs_to:order

## itemsテーブル

|Column|Type|Options|
|name              |string    |null:false|
|message           |text      |null:false|
|category_id       |integer   |null:false|
|condition_id      |integer   |null:false|
|shipping_charge_id|integer   |null:false|
|shipping_region_id|integer   |null:false|
|shipping_date_id  |integer   |null:false|
|price             |integer   |null:false|
|user              |references|null:false,foreign_key: true|

### Association

belongs_to:user
has_one:order

