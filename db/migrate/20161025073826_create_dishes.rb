class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.string :image
      t.boolean :special, default: false
      t.references :category, index: true, foreign_key: true
      t.references :branch, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
