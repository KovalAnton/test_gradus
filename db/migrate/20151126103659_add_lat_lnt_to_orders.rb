class AddLatLntToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :lat, :string
    add_column :orders, :lng, :string
  end
end
