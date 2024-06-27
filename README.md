# テーブル設計

## usersテーブル

| Column             |Type    | Options     |
|--------------------|--------|-------------|
| nickname               | string | null: false |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false |
| first_name               | string | null: false |
| last_name               | string | null: false |
| first_name_kana               | string | null: false |
| last_name_kana               | string | null: false |
| birth_date               | date | null: false |

### Association

- has_many :items
- has_many :orders



## itemsテーブル
| Column             |Type    | Options     |
|--------------------|--------|-------------|
| image               | string | null: false |
| name               | string | null: false |
| text               | text | null: false |
| category               | string | null: false |
| condition               | string | null: false |
| charge               | string | null: false |
| ship_from               | string | null: false |
| days_to_ship               | string | null: false |
| price               | integer | null: false |
| user              | references | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user



## ordersテーブル
| Column             |Type    | Options     |
|--------------------|--------|-------------|
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address



## addressesテーブル
| Column             |Type    | Options     |
|--------------------|--------|-------------|
| postcode               | string | null: false |
| prefecture               | string | null: false |
| city               | string | null: false |
| block               | string | null: false |
| building               | string |  |
| phone_number               | string | null: false |
| order               | references | null: false, foreign_key: true |

### Association

- belongs_to :order