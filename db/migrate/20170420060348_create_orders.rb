class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :total_price
      t.string :customer_name
      t.string :phone_number
      t.string :address
      t.timestamps
    end
  end
end
