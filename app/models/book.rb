class Book < ApplicationRecord
  has_many :comments
  has_many :rents
  has_many :wishes
  has_many :book_suggestions
end
