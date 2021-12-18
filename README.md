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

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| burdened      | references | null: false,                   |
| item          | references | null: false,                   |
| explanation   | text       | null: false,                   |
| category      | references | null: false,                   |
| details       | text       | null: false,                   |
| price         | references | null: false,                   |
| delivery_area | string     | null: false,                   |
| delivery_day  | string     | null: false,                   |

### Association

- belongs_to :buyer
- belongs_to :user

## buyers テーブル   購入記録

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| items     | references | null: false, foreign_key: true |


### Association

* has_one :buyer
* has_one :item
- belongs_to :user


## deliverys テーブル   発送先情報

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| buyer            | references | null: false, foreign_key: true |
| delivery_area    | references | null: false                    |
| city             | string     | null: false                    |
| street           | string     | null: false                    |
| building         | string     | null: false                    |
| posttal_code     | string     | null: false                    |
| telephone_number | string     | null: false                    |

### Association

- belongs_to :buyer