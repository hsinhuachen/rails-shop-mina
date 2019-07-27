class AddPublishToHome < ActiveRecord::Migration[5.2]
  def change
    add_column :homes, :publish, :boolean
  end
end
