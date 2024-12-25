class CreatePropertyRatings < ActiveRecord::Migration[8.0]
  def change
    create_table :property_ratings do |t|
      t.references :property, foreign_key: true
      t.string :category
      t.integer :score
      t.text :notes
      t.timestamps
    end
  end
 end