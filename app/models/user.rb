class User < ApplicationRecord
    has_many :collections
    has_many :comic_books, through: :collections
end
