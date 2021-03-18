# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = User.create(username: "admin", password: "admin", image: "https://www.google.com")
@book = Book.create(image: "", title: "Relato de un náufrago", author: "Gabriel García Márquez", year: "1955", status: "Available", genre: "Novel")
Comment.create(book: @book, user: @user, content: "Nice!")
