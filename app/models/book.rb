class Book < ApplicationRecord
    has_many :books_racks
    has_many :bookmarks, through: :books_racks
    has_many :users, through: :bookmarks
    has_many :books_authors
    has_many :authors, through: :books_authors

    scope :highest_rated, -> {where('average_rating >= ?', 5).order(average_rating: "DESCRIPT")}

    validates :title, presence :true
    validates :isbn, presence :true, uniqueness :true

    def most_popular
        average_rating.to_i * rating_score.to_i
    end

    def self.highest_rated_sorted
        highest_rated.sort_by {|book| book.most_popular}
    end

    def self.search(search)
        book = GoogleBooks.search("#{ search }", { count: 5 })
    end
    
end
