class AddSortingToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :sorting, :integer, default: 0
  end
end
