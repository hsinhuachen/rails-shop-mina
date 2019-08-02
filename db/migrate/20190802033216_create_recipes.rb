class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :desc
      t.text :practice
      t.boolean :publish
      t.integer :sorting
      t.string :image

      t.timestamps
    end
  end
end
