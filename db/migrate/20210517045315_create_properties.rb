class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :name
      t.integer :rent
      t.string :address
      t.integer :year
      t.text :memo

      t.timestamps
    end
  end
end
