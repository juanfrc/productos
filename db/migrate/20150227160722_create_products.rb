class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.boolean :published

      change_column :published, :boolean, :default => false

      t.timestamps
    end
  end
end
