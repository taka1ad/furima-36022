# テーブル設計

## users テーブル

| Column                | Type   | Options                        |
| --------------------- | ------ | ------------------------------ |
| nickname              | string | null: false                    |
| email                 | string | null: false, foreign_key: true |
| password              | string | null: false                    |
| password_confirmation | string | null: false                    |
| first_name            | string | null: false                    |
| last_name             | string | null: false                    |
| first_name(kana)      | string | null: false                    |
| last_name(kana)       | string | null: false                    |
| birthday              | string | null: false                    |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| name              | string | null: false |
| explanation       | text   | null: false |
| category          | string | null: false |
| condition         | string | null: false |
| delivery_charge   | string | null: false |
| delivery_area     | string | null: false |
| delivery_days     | string | null: false |
| price_text_id     | string | null: false |

### Association

- belongs_to :users
- belongs_to :buyers

## buyers テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- has_many :users
- has_many :addresses

## addresses テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| postal_code_id   | string | null: false |
| prefectures_id   | string | null: false |
| manicipality_id  | string | null: false |
| house_number_id  | string | null: false |
| building_name_id | string | null: false |
| phone_number_id  | string | null: false |

### Association

- belongs_to :buyers