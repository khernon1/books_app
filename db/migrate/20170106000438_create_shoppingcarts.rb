class CreateShoppingcarts < ActiveRecord::Migration[5.0]
  def change
    create_table :shoppingcarts do |t|
      t.integer :customer_id
      t.datetime :add_date
      t.integer :book_id

      t.timestamps
    end
  end
end
