class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.text :description
      t.text :convenience
      t.integer :price
      t.text :address

      t.timestamps null: false
    end
  end
end
