class CreateRandomBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :random_books do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.text :description

      t.timestamps
    end
  end
end
