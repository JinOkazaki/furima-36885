## usersテーブル

|Column             |Type   |Options                  |
|-------------------|-------|-----------              |
|nickname           |string |nill: false              |
|email              |string |nill: false, unique: true|
|encrypted_password |string |nill: false              |
|first_name         |string |nill: false              |   
|last_name          |string |nill: false              |
|first_name_kana    |string |nill: false              |
|last_name_kana     |string |nill: false              |
|birthday         |date   |nill: false              |


### Association
 - has_many: items
 - has_many: orders

 ## itemsテーブル

|Column                 |Type     |Options                         |
|-----------------------|---------|------------------------------|
|name                   |string   |nill: false                   |
|explanation            |text     |nill: false                   |
|category_id            |integer  |nill: false                   |
|status_id              |integer  |nill: false                   |
|delivery_fee_id        |integer  |nill: false                   |
|prefecture_id          |integer  |nill: false                   |
|shopping_day_id        |integer  |nill: false                   |
|price                  |integer  |nill: false                   |
|user                   |reference|nill: false, foreign_key: true|



### Association
- belongs_to: user
- has_one :order

## ordersテーブル

|Column             |Type     |Options                       |
|-------------------|---------|------------------------------|
|user               |reference|nill: false, foreign_key: true|
|item               |reference|nill: false, foreign_key: true|


### Association
- belongs_to: user
- belongs_to: item
- has_one: buyer

## buyersテーブル

|Column             |Type   |Options                         |
|-------------------|---------|------------------------------|
|postal             |string   |nill: false                   |
|prefecture_id      |integer  |nill: false                   |
|city               |string   |nill: false                   |
|address            |string   |nill: false                   |
|building_name      |string   |                              |
|tell_number        |string   |nill: false                   |
|order              |reference|nill: false, foreign_key: true|

## Association
- belongs_to :order