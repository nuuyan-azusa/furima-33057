# furinmaデータベース設計

## usersテーブル

| Column             | Type       | Options
| ------------------ | ---------- | -----------------
| nickname           | string     | null: false
| first_name         | string     | null: false
| last_name          | string     | null: false
| first_name_reading | string     | null: false
| last_name_reading  | string     | null: false
| email              | string     | null: false
| encrypted_password | string     | null: false
| birthday           | date       | null: false

### Association

has_many :items
has_many :order

## itemsテーブル

| Column              | Type       | Options
| ------------------- | ---------- | ----------------
| text                | text       | null: false
| price               | integer    | null: false
| name                | string     | null: false
| category_id         | integer    | null: false
| state_id            | integer    | null: false
| delivery_fee_id     | integer    | null: false
| prefecture_id       | integer    | null: false
| delivery_by_days_id | integer    | null: false
| user                | references | foreign_key: true

### Association

belongs_to :user
has_one :order

## addressesテーブル

| Column        | Type       | Options
| ------------- | ---------- | -----------------
| postal_code   | string     | null: false
| prefecture_id | integer    | null: false
| city          | string     | null: false
| house_number  | string     | null: false
| building_name | string     |
| phone_number  | string     | null: false
| order         | references | foreign_key: true

### Association
belongs_to :order

## Ordersテーブル

| Column  | Type       | Options
| ------- | ---------- | -----------------
| user    | references | foreign_key: true
| item    | references | foreign_key: true

### Association
belongs_to :user
has_one :address
belongs_to :item