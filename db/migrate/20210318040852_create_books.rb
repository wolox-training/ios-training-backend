class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
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
