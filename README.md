# テーブル設計

## users テーブル

| Column             | Type   | Options    |
| ------------------ | ------ | -----------|
| nickname           | string | null:false | 
| email              | string | null:false, unique:true | 
| encrypted_password | string | null:false | 
| family_name        | string | null:false | 
| first_name         | string | null:false | 
| family_name_kana   | string | null:false | 
| first_name_kana    | string | null:false | 
| birthday           | date   | null:false | 

### Association 

- has_many :items
- has_many :order

## items テーブル

|               |         |                                | 
| ------------- | ------- | ------------------------------ | 
| name          | string  | null:false                     | 
| price         | integer | null:false                     | 
| text          | text    | null:false                     | 
| delivery_day_id| integer| null:false                     | 
| prefecture_id | integer | null:false                     | 
| category_id   | integer | null: false                    | 
| condition_id  | integer | null: false                    | 
| delivery_fee_id| integer| null: false                    | 
| user         |references| null: false, foreign_key: true | 

### Association

- belongs_to :user 
- belongs_to :category_id
- belongs_to :condition_id
- belongs_to :prefecture_id
- belongs_to :delivery_day_id
- belongs_to :delivery_fee_id
- has_one :order

## order テーブル

|        |           |                                | 
| -------| -------   | ------------------------------ | 
| user   | references| null:false, foreign_key: true  |
| items  | references| null:false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one :buyer address

## buyer Address テーブル

|                  |         |                               | 
| ---------------- | ------- | ----------------------------- | 
| user_id          | integer | null:false, foreign_key: true | 
| family_name      | string  | null:false                    | 
| first_name       | string  | null:false                    | 
| family_name_kana | string  | null:false                    | 
| first_name_kana  | string  | null:false                    | 
| post_code        | string  | null:false                    | 
| prefecture_id    | integer | null:false                    | 
| city             | string  | null:false                    | 
| address          | string  | null:false                    | 
| building_name    | string  |                               | 
| phone_number     | string  | null:false                    | 

### Association

- belongs_to :order
- belongs_to :user_id
- belongs_to :prefecture_id