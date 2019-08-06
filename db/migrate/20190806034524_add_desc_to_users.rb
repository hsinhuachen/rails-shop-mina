class AddDescToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :tel, :string
  	add_column :users, :mobile, :string
  	add_column :users, :name, :string
  	add_column :users, :address, :text
  	add_column :users, :birthday, :text
  	add_column :users, :gender, :integer, default: 0
  end
end
