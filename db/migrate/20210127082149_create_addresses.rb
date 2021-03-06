class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :tel
      t.string :post_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :block_number, null: false
      t.string :building_name
      t.integer :user_id, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
