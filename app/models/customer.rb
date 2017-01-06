class Customer < ApplicationRecord
  has_one :shoppingcart
  # has_many :books, through: :shoppingcarts

# Find and return each customer with 
# zero, five, or ten books in the shopping cart.
  def customers_with_specific_carts
    sql = <<-SQL
      SELECT
        (case when COUNT(shoppingcarts.customer_id) = 0 then 0
              when COUNT(shoppingcarts.customer_id) = 5 then 5
              when COUNT(shoppingcarts.customer_id) = 10 then 10 
        end) as book_count, customers.email
        FROM customers
        JOIN shoppingcarts
        ON shoppingcarts.customer_id = customers.id
        GROUP BY customers.email
        HAVING book_count IS NOT NULL        
    SQL
    
    ActiveRecord::Base.connection.execute(sql).each do |id|
      puts "Email: #{id[1]}, Books: #{id[0]}"
    end
    
  end

  def count_customers_items
    sql = <<-SQL
      SELECT customers.email, COUNT(shoppingcarts.customer_id) as count
        FROM customers
        JOIN shoppingcarts
        ON shoppingcarts.customer_id = customers.id
        GROUP BY customers.email
    SQL

    ActiveRecord::Base.connection.execute(sql).each do |id|
      puts "Email: #{id[1]}, Items: #{id[0]}"
    end

  end

end
