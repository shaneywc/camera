class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.string :make
      t.text :description
      t.float :price
      t.string :image

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
