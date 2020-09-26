class AddImgToRandomBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :random_books, :img, :string
  end
end
