class IntegerLimitInTable < ActiveRecord::Migration[5.2]
  def change
    change_column :books, :isbn, :integer, limit:10
  end
end
