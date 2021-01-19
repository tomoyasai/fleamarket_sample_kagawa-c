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
|personal_id|integer|null: false,foreign_key: true|
|card_id|integer,foreign_key: true|
### Association
- has_many :personals
- belongs_to :cards
- has_many :buy_data
- has_many :display_data
- belongs_to :items

## personalsテーブル
|Column|Type|Options|
|------|----|-------|
|family|string|null: false|
|first|string|null: false|
|family_yomi|string|null: false|
|first_yomi|string|null: false|
|tel|string|unique: true|
|post_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block_number|string|null: false|
|building_name|string|
|user_id|integer|null: false,foreign_key: true|
### Association
- belongs_to :users

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|number|string|null: false|
|expiry_date|string|null: false|
|security_code|string|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :users

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|info|text|null: false|
|category_id|references|null: false|
|status|string|null: false|
|delivery_fee|string|null: false|
|delivery_fee|string|null: false|
|delivery_fee|string|null: false|
|image_id|integer|null: false,foreign_key: true|
|user_id|integer|null: false,foreign_key: true|
|price|integer|null: false|
|sales_comm|integer|null: false|
|sale|string|null: false|
### Association
- belongs_to :users
- belongs_to :buy_data
- belongs_to :display_data
- has_many :images
- has_many :categories
- has_many :comments

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
### Association
- belongs_to :items

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
|ancestry|string||
### Association
- belongs_to :items

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|integer|null: false,foreign_key: true|
|item_id|integer|null: false,foreign_key: true|
### Association
- belongs_to :items

## buy_dataテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false,foreign_key: true|
|item_id|integer|null: false,foreign_key: true|
### Association
- belongs_to :users
- belongs_to :items

## display_dataテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false,foreign_key: true|
|item_id|integer|null: false,foreign_key: true|
### Association
- belongs_to :users
- belongs_to :items