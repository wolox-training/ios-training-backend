class CreateBookSuggestions < ActiveRecord::Migration[6.1]
  def change
    create_table :book_suggestions do |t|
      t.references :book, null: false, foreign_key: true
      t.string :image
      t.string :title
      t.string :author
      t.string :year
      t.string :status
      t.string :genre

      t.timestamps
    end
  end
end
