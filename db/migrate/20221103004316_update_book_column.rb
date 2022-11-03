class UpdateBookColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :average_rating, :average_score
    rename_column :books, :rating_score, :ratings_score
  end
end
