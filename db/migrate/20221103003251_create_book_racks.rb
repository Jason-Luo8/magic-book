class CreateBookRacks < ActiveRecord::Migration[5.2]
  def change
    create_table :book_racks do |t|
      t.integer :book_id
      t.integer :bookmark_id

      t.timestamps
    end
  end
end
