class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :author_id
      t.text :description
      t.integer :average_rating
      t.integer :rating_score

      t.timestamps
    end
  end
end
