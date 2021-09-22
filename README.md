## usersテーブル

|Column             |Type   |Options    |
|-------------------|-------|-----------|
|nickname           |string |nill: false|
|email              |string |nill: false|
|encrypted_password |string |nill: false|
|first_name         |string |nill: false|
|last_name          |string |nill: false|
|first_name_kana    |string |nill: false|
|last_name_kana     |string |nill: false|
|birth_year         |integer|nill: false|
|birth_month        |integer|nill: false|
|birth_day          |integer|nill: false|


### Association
 - has_many: items
 - has_many: orders

 ## itemsテーブル

|Column             |Type   |Options                         |
|-------------------|---------|------------------------------|
|name               |string   |nill: false                   |
|explanation        |text     |nill: false                   |
|image              |         |                              |
|category           |string   |nill: false                   |
|status             |string   |nill: false                   |
|delivery_fee       |string   |nill: false                   |
|prefecture         |string   |nill: false                   |
|shopping_days      |string   |nill: false                   |
|price              |integer  |nill: false                   |
|commission         |integer  |nill: false                   |
|profit             |integer  |nill: false                   |
|user               |reference|nill: false, foreign_key: true|



### Association
- belongs_to: user
- has_one :order

## ordersテーブル

|Column             |Type   |Options                         |
|-------------------|---------|------------------------------|
|postal             |integer  |nill: false                   |
|prefecture         |string   |nill: false                   |
|city               |string   |nill: false                   |
|address            |string   |nill: false                   |
|building_name      |string   |nill: false                   |
|tell_number        |integer  |nill: false                   |
|user               |reference|nill: false, foreign_key: true|
|item               |reference|nill: false, foreign_key: true|


### Association
- belongs_to: user
- belongs_to: item