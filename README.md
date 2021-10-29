# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| name                  | string | null: false |
| name_kana             | string | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| image             | string | null: false |
| name              | string | null: false |
| explanation       | string | null: false |
| category          | string | null: false |
| condition         | string | null: false |
| delivery_charge   | string | null: false |
| delivery_area     | string | null: false |
| price_text        | string | null: false |

### Association

- belongs_to :users
- belongs_to :buyers

## buyers テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| buyer_id     | references | null: false, foreign_key: true |
| buyer_item   | references | null: false, foreign_key: true |

### Association

- has_many :users
- has_many :addresses

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     |                                |
| prefectures   | references | null: false, foreign_key: true |
| manicipality  | references | null: false, foreign_key: true |
| house_number  | references | null: false, foreign_key: true |
| building_name | references | null: false, foreign_key: true |
| phone_number  | references | null: false, foreign_key: true |

### Association

- belongs_to :buyers