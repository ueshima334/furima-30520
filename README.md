# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

- has_many :products
- has_many :comments


## products テーブル

| Column          | Type      | Options                       |
| --------------- | --------- | ----------------------------- |
| title           | string    | null: false                   |
| details         | text      | null: false                   |
| category        | string    | null: false                   |
| status          | string    | null: false                   |
| delivery_charge | integer   | null: false                   |
| area            | string    | null: false                   |
| days            | string    | null: false                   |
| price           | integer   | null: false                   |
| user            | reference | null: false,foreign_key: true |

- belongs_to :user
- has_many   :comments


## comments テーブル

| Column   | Type       | options                        |
| -------- | ---------- | ------------------------------ |
| text     | string     | null: false                    |
| user     | references | null: false, foreign_key: true |
| products | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :product