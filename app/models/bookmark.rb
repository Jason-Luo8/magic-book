class Bookmark < ApplicationRecord
    belongs_to :user
    has_many :books_racks
    has_many :books, through: :book_shelves

    validates :name, presence :true
end
