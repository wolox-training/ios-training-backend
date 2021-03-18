class CreateRents < ActiveRecord::Migration[6.1]
  def change
    create_table :rents do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.date :to
      t.date :from

      t.timestamps
    end
  end
end
