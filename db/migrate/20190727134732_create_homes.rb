class CreateHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :homes do |t|
      t.string :image
      t.text :desc
      t.integer :sorting, default: 0

      t.timestamps
    end
  end
end
