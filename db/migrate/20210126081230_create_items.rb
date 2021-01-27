class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :info, null: false
      t.references :category, null: false, foreign_key: true
      t.intger :status_id, null: false
      t.intger :delivery_fee_id, null: false
      t.intger :elivery_area_id, null: false
      t.intger :delivery_days_id, null: false
      t.intger :user_id, null: false, foreign_key: true
      t.intger :price, null: false
      t.timestamps
    end
  end
end
