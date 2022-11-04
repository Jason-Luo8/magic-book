class BooksRack < ApplicationRecord
    belongs_to :book
    belongs_to :bookmark

    def self.select_association(array)
        self.where("bookmark_id = ?, book_id = ?", "array[0]", "array[1]").id
    end
    
end
