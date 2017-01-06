class Book < ApplicationRecord
  has_one :shoppingcart
  # belongs_to :shoppingcart
  # has_many :shoppingcarts, through: :customers

# For every author, show how many 
# total units of his/her books are in a cart.
  def count_authors_books
    sql = <<-SQL
      SELECT books.author, COUNT(books.title)
        FROM books
        JOIN shoppingcarts
        ON shoppingcarts.book_id = books.id
        GROUP BY books.author
        ORDER BY books.author
    SQL
    
    ActiveRecord::Base.connection.execute(sql).each do |id|
      puts "Author: #{id[0]}, Books Count: #{id[1]}"
    end
  end

# Show the top 10 books along with count of units in a cart.
  def top_10_books
    sql = <<-SQL
      SELECT books.title, COUNT(books.title) as books_count
        FROM books
        JOIN shoppingcarts
        ON shoppingcarts.book_id = books.id
        GROUP BY books.title
        ORDER BY books_count DESC LIMIT 10
    SQL
    
    ActiveRecord::Base.connection.execute(sql).each do |id|
      puts "Title: #{id[0]}, Books Count: #{id[1]}"
    end
  end

end