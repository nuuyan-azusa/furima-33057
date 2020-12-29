# furinmaデータベース設計

## usersテーブル

| Column             | Type       | Options
| ------------------ | ---------- | -----------------
| nickname           | string     | null: false
| email              | string     | null: false
| encrypted_password | string     | null: false
| birthday           | integer    | null: false
| address            | references | foreign_key: true
| item               | references | foreign_key: true

### Association

has_one :address
has_many :items
has_one :order

## itemsテーブル

| Column              | Type       | Options
| ------------------- | ---------- | ----------------
| text                | text       | null: false
| price               | integer    | null: false
| name                | string     | null: false
| category_id         | integer    | null: false
| state_id            | integer    | null: false
| delivery_fee_id     | integer    | null: false
| delivery_area_id    | integer    | null: false
| delivery_by_days_id | integer    | null: false
| user                | references | foreign_key: true

### Association

belongs_to :user
has_one :address
has_one :order

## addressesテーブル

| Column        | Type       | Options
| ------------- | ---------- | -----------------
| postal_code   | string     | null: false
| prefecture_id | integer    | null: false
| city          | string     | null: false
| house_number  | string     | null: false
| phone_number  | string     | null: false
| user          | references | foreign_key: true

### Association
belongs_to :order
belongs_to :item
has_many :users

## Ordersテーブル

| Column  | Type       | Options
| ------- | ---------- | -----------------
| user    | references | foreign_key: true
| item    | references | foreign_key: true
| address | references | foreign_key: true

### Association
belongs_to :user
belongs_to :address
belongs_to :item