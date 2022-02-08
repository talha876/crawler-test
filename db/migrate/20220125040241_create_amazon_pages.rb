class CreateAmazonPages < ActiveRecord::Migration[5.2]
  def change
    create_table :amazon_pages do |t|
      t.string :url

      t.timestamps
    end
  end
end
