# DB設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

* has_many :items
* has_many :comments

## items テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | string     |                                |
| user      | references | null: false, foreign_key: true |
| item_name | references | null: false, foreign_key: true |
| category  | references | null: false, foreign_key: true |
| price     | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## buyers テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |


### Association

- belongs_to :user

## deliverys テーブル

| Column           | Type       | Options                                 |
| ---------------- | ---------- | --------------------------------------- |
| content          | string     |                                         |
| delivery_address | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |
| room             | references | null: false, foreign_key: true |

### Association
