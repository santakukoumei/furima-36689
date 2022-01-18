# DB設計

## users テーブル   ユーザー情報

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
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
* has_many :orders

## items テーブル   商品情報

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item_name        | string     | null: false                    |
| explanation      | text       | null: false                    |#説明
| category_id      | integer    | null: false                    |
| details_id       | integer    | null: false                    |#詳細
| price            | integer    | null: false                    |
| burdened_id      | integer    | null: false                    |#負担
| delivery_area_id | integer    | null: false                    |
| delivery_day_id  | integer    | null: false                    |

### Association

* has_one :order
- belongs_to :user

## orders テーブル   購入記録

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association

* has_one :delivery
- belongs_to :item
- belongs_to :user


## deliveries テーブル   発送先情報

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| delivery_area_id | integer    | null: false                    |#都道府県
| city             | string     | null: false                    |#市町村
| street           | string     | null: false                    |#番地
| building         | string     |                                |#建物
| postal_code      | string     | null: false                    |
| telephone_number | string     | null: false                    |

### Association

- belongs_to :order
