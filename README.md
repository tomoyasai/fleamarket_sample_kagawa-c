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
|encrypted_password|string|null: false|
|birthday|date|null: false|
|family|string|null: false|
|first|string|null: false|
|family_kana|string|null: false|
|first_kana|string|null: false|
### Association
- has_one :address,dependent: :destroy
- has_one :card,dependent: :destroy
- has_many :buy_data
- has_many :items
- has_many :comments

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|tel|string|unique: true|
|post_code|string|null: false|
|prefecture_id|integer|null: false|
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
|paycard_id|string|null: false|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|info|text|null: false|
|category|references|null: false,foreign_key: true|
|status_id|integer|null: false|
|delivery_fee_id|integer|null: false|
|delivery_area_id|integer|null: false|
|delivery_days_id|integer|null: false|
|user_id|integer|null: false,foreign_key: true|
|price|integer|null: false|
### Association
- belongs_to :user
- has_one :buy_data
- has_many :images
- belongs_to :category
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
- belongs_to :user
- belongs_to :item

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false,foreign_key: true|
|item_id|integer|null: false,foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## buy_dataテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false,foreign_key: true|
|item_id|integer|null: false,foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item