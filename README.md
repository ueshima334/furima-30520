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
- has_many :buyers


## products テーブル

| Column             | Type      | Options                       |
| ------------------ | --------- | ----------------------------- |
| title              | string    | null: false                   |
| details            | text      | null: false                   |
| category_id        | integer   | null: false                   |
| status_id          | integer   | null: false                   |
| delivery_charge_id | integer   | null: false                   |
| area_id            | integer   | null: false                   |
| days_id            | integer   | null: false                   |
| price              | integer   | null: false                   |
| user               | reference | null: false,foreign_key: true |

- belongs_to :user
- has_many   :comments
- has_one    :buyer

## comments テーブル

| Column   | Type       | options                        |
| -------- | ---------- | ------------------------------ |
| text     | string     | null: false                    |
| user     | references | null: false, foreign_key: true |
| product  | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :product


## buyers テーブル

| Column   | Type       | options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| product  | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :product
- has_one    :buyer_date

## buyer_dates テーブル

| Column        | Type       | options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| buyer         | references | null: false, foreign_key: true |

- belongs_to :buyer
