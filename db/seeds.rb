# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@users = User.create([
  { username: "admin", password: "admin", image: "https://goo.gl/1PBWVM" },
  { username: "juanrodriguez", password: "juanrodriguez", image: "https://goo.gl/1PBWVM" },
  { username: "manuelhernandez", password: "manuelhernandez", image: "https://goo.gl/1PBWVM" },
  { username: "rodrigogarcia", password: "rodrigogarcia", image: "https://goo.gl/1PBWVM" },
  { username: "sergiohernandez", password: "sergiohernandez", image: "https://goo.gl/1PBWVM" },
  { username: "test", password: "test", image: "https://goo.gl/1PBWVM" },
])

@books = Book.create([
  { image: "http://wolox-training.s3.amazonaws.com/uploads/content.jpeg", title: "The Girl on the Train", author: "Paula Hawkins", year: "2015", status: "Available", genre: "suspense" },
  { image: "http://wolox-training.s3.amazonaws.com/uploads/41DNuJfahyL._SX322_BO1_204_203_200_.jpg", title: "The Martian", author: "Andy Weir", year: "2011", status: "Available", genre: "fiction" },
  { image: "http://wolox-training.s3.amazonaws.com/uploads/6942334-M.jpg", title: "Locked in time", author: "Lois Duncan", year: "1985", status: "Available", genre: "suspense" },
  { image: "http://wolox-training.s3.amazonaws.com/uploads/6963511-M.jpg", title: "Scavenger Hunt", author: "Christopher Pike", year: "1989", status: "Available", genre: "suspense" },
  { image: "http://wolox-training.s3.amazonaws.com/uploads/content.jpeg", title: "All the Light We Cannot See", author: "Anthony Doerr", year: "2014", status: "Available", genre: "suspense" },
  { image: "http://wolox-training.s3.amazonaws.com/uploads/el-psicoanalista-analyst-john-katzenbach-paperback-cover-art.jpg", title: "The analyst", author: "John Katzenbach", year: "2003", status: "Available", genre: "thriller" },
  { image: "", title: "La Gran Dani", author: "Dani", year: "1992", status: "Available", genre: "fiction" },
  { image: "http://wolox-training.s3.amazonaws.com/uploads/js_good_parts.png", title: "Javascript: The Good Parts", author: "Douglas Crockford", year: "2008", status: "Available", genre: "programming" },
])

@users.take(4).each do |user|
  @books.take(4).each do |book|
    Comment.create(book: book, user: user, content: "This book is great!")
  end
end

@users.take(2).each do |user|
  @books.take(2).each do |book|
    Rent.create(book: book, user: user, from: Date.today, to: Date.today + 3)
  end
end

@users.take(1).each do |user|
  @books.take(1).each do |book|
    Wish.create(book: book, user: user)
  end
end
