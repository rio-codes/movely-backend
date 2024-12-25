class CreateProperties < ActiveRecord::Migration[8.0]
  def change
    create_table :properties do |t|
      t.references :user, foreign_key: true
      t.text :address, null: false
      t.decimal :price
      t.integer :square_footage
      t.integer :bedrooms
      t.integer :bathrooms
      t.jsonb :hoa_info
      t.integer :overall_rating
      t.timestamps
    end
  end
 end