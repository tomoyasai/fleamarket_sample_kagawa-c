class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :info, null: false
      t.references :category, null: false, foreign_key: true
      t.integer :status_id, null: false
      t.integer :delivery_fee_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :delivery_days_id, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.integer :price, null: false
      t.timestamps
    end
  end
end
