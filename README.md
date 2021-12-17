# DB設計

## users テーブル   ユーザー情報

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| first_name         | string | null: false |
| second_name        | string | null: false |
| first_name_kana    | string | null: false |
| second_name_kana   | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| birth_date         | date   | null: false |


### Association

* has_many :items
* has_many :user

## items テーブル   商品情報

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| burdened      | references | null: false,                   |
| item_name     | references | null: false,                   |
| explanation   | references | null: false,                   |
| category      | references | null: false,                   |
| details       | references | null: false,                   |
| price         | references | null: false,                   |
| delivery_area | references | null: false,                   |
| delivery_day  | references | null: false,                   |

### Association

* has_one :delivery
- belongs_to :user

## buyers テーブル   購入記録

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item_name | references | null: false, foreign_key: true |


### Association

* has_one :buyer
- belongs_to :user


## deliverys テーブル   発送先情報

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| buyers           | references | null: false, foreign_key: true |
| delivery_area    | references | null: false                    |
| city             | references | null: false                    |
| street           | references | null: false                    |
| building         | references | null: false                    |
| posttal_code     | references | null: false                    |
| telephone_number | references | null: false                    |

### Association

- belongs_to :user