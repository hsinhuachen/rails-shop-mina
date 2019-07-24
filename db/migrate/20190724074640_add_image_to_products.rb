class AddImageToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :image, :string 
    add_column :products, :publish, :boolean, default: false
    add_column :products, :latest, :boolean, default: false
    add_column :products, :category_id, :integer
  end
end
