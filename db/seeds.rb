Customer.destroy_all
Book.destroy_all
Shoppingcart.destroy_all

authors = []
20.times do 
  author = Faker::Book.author
  authors.push(author)
end

200.times do
  Book.create(title: Faker::Book.title,
              author: authors.sample
              )
end

50.times do
  Customer.create(enroll_date: rand(2.years).seconds.ago,
                  email: Faker::Internet.email
    )
end

500.times do
  customer = Customer.all.find(rand(Customer.first.id..Customer.last.id))
  book = Book.all.find(rand(Book.first.id..Book.last.id))
  Shoppingcart.create(customer: customer,
                      add_date: rand(1.years).seconds.ago,
                      book: book
    )
end