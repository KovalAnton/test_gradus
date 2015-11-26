class ChangeAdsLngLntTypes < ActiveRecord::Migration
  def change
    change_column :orders, :lng, :float
    change_column :orders, :lat, :float
  end
end
