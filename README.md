# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Furima DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nick_name|string|null: false,unique: true|
|email|string|null: false|
|pass|string|null: false|
|pass_A|string|null: false|
|birthday|data|null: false|
|family|string|null: false|
|first|string|null: false|
|family_kana|string|null: false|
|first_kana|string|null: false|
|personal_id|integer|null: false,foreign_key: true|
### Association
- has_many :personals
- has_one :card,dependent: :destroy
- has_many :buy_data
- has_many :display_data
- belongs_to :item

## personalsテーブル
|Column|Type|Options|
|------|----|-------|
|tel|string|unique: true|
|post_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block_number|string|null: false|
|building_name|string|
|user_id|integer|null: false,foreign_key: true|
### Association
- belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false,foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|info|text|null: false|
|category_id|references|null: false,foreign_key: true|
|status|string|null: false|
|delivery_fee|string|null: false|
|delivery_area|string|null: false|
|delivery_days|string|null: false|
|image_id|integer|null: false,foreign_key: true|
|user_id|integer|null: false,foreign_key: true|
|price|integer|null: false|
|sales_comm|integer|null: false|
|sale|string|null: false|
### Association
- belongs_to :user
- belongs_to :buy_data
- belongs_to :display_data
- has_many :images
- has_many :categories
- has_many :comments

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false,foreign_key: true|
### Association
- belongs_to :item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
- belongs_to :item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|integer|null: false,foreign_key: true|
|item_id|integer|null: false,foreign_key: true|
### Association
- belongs_to :item

## buy_dataテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false,foreign_key: true|
|item_id|integer|null: false,foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## display_dataテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false,foreign_key: true|
|item_id|integer|null: false,foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item