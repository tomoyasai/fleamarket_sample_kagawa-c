class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.integer :user_id, null: false,foreign_key: true
      t.string :customer_id, null: false
      t.string :paycard_id, null: false
      t.timestamps
    end
  end
end