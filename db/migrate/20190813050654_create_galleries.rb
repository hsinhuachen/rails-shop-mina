class CreateGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :galleries do |t|
      t.string :filename
      t.integer :sorting
      t.integer :product_id

      t.timestamps
    end
  end
end
