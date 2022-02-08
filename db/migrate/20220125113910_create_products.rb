class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :avg_rating
      t.integer :ratings_count
      t.string :esbr_rating
      t.string :release_date
      t.string :manufacturer
      t.string :url
      t.string :price

      t.timestamps
    end
  end
end
