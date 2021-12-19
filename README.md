# DB設計

## users テーブル   ユーザー情報

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false               |
| first_name         | string | null: false               |
| second_name        | string | null: false               |
| first_name_kana    | string | null: false               |
| second_name_kana   | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| birth_date         | date   | null: false               |


### Association

* has_many :items
* has_many :buyers

## items テーブル   商品情報

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| burdened_id      | integer    | null: false,                   |
| item-name        | references | null: false,                   |
| explanation      | text       | null: false,                   |
| category_id      | integer    | null: false,                   |
| details_id       | integer    | null: false,                   |
| price            | references | null: false,                   |
| delivery_area_id | integer    | null: false,                   |
| delivery_day_id  | integer    | null: false,                   |

### Association

* has_one :buyer
- belongs_to :user

## buyers テーブル   購入記録

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| items     | references | null: false, foreign_key: true |


### Association

* has_one :delivery
- belongs_to :item
- belongs_to :user


## deliverys テーブル   発送先情報

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| buyer            | references | null: false, foreign_key: true |
| delivery_area_id | integer    | null: false                    |
| city             | string     | null: false                    |
| street           | string     | null: false                    |
| building         | string     |                                |
| posttal_code     | string     | null: false                    |
| telephone_number | string     | null: false                    |

### Association

- belongs_to :buyer
