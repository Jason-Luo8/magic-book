class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
