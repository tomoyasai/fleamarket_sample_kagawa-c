class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |m|
      t.string :tel
      t.string :post_code
      t.integer :prefecture
      t.string :city
      t.string :block_number
      t.string :building_name
      t.integer :user_id
      # t.string :tel, uniqueness: true
      # t.string :post_code, null: false
      # t.integer :prefecture, null: false
      # t.string :city, null: false
      # t.string :block_number, null: false
      # t.string :building_name
      # t.integer :user_id, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
