class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.datetime :enroll_date
      t.text :email

      t.timestamps
    end
  end
end
