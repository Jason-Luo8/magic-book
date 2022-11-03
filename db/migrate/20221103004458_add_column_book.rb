class AddColumnBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :image_source, :string
    add_column :books, :isbn, :integer
    add_column :books, :category_id, :integer
  end
end
