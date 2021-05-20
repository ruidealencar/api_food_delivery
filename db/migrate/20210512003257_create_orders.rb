class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :phone_number
      t.float :total_value
      t.integer :status, default: 0
      t.references :restaurant, null: false, foreign_key: true
      t.string :city
      t.string :street
      t.string :neighborhood
      t.string :number
      t.string :complement

      t.timestamps
    end
  end
end
