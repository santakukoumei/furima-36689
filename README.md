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
| year               | string | null: false |
| month              | string | null: false |
| day                | string | null: false |

### Association

* has_many :items

## items テーブル   商品情報

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| image       | references | null: false, foreign_key: true |
| item_name   | references | null: false, foreign_key: true |
| explanation | references | null: false, foreign_key: true |
| category    | references | null: false, foreign_key: true |
| details     | references | null: false, foreign_key: true |
| price       | references | null: false, foreign_key: true |

### Association

* has_one :buyers
- belongs_to :user

## buyers テーブル   購入記録

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |


### Association

- belongs_to :user


## deliverys テーブル   発送先情報

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| delivery_address | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user