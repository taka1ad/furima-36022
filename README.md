# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| first_name            | string | null: false |
| last_name             | string | null: false |
| first_name_kana       | string | null: false |
| last_name_kana        | string | null: false |
| birthday              | string | null: false |

### Association

- has_many :items
- has_many :buyer

## items テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| name              | string  | null: false |
| explanation       | text    | null: false |
| category          | string  | null: false |
| condition         | string  | null: false |
| delivery_charge   | string  | null: false |
| delivery_area     | string  | null: false |
| delivery_days     | string  | null: false |
| price_text_id     | integer | null: false |

### Association

- belongs_to :user
- has_many :buyers

## buyers テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :address

## addresses テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| postal_code    | string  | null: false |
| prefectures_id | integer | null: false |
| manicipality   | string  | null: false |
| house_number   | string  | null: false |
| building_name  | string  |             |
| phone_number   | string  | null: false |

### Association

- belongs_to :buyer