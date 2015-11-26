class Order < ActiveRecord::Base
  dragonfly_accessor :image
  validates :name, length: { maximum: 30, minimum:10 }
  validates :description, length: { maximum: 200, minimum:10 }
  validates :address, length: { maximum: 50, minimum:10 }
  validates :convenience, length: { maximum: 100, minimum:10 }
  validates :price, numericality: { greather_than: 0}

  def geoposition
    { lat: lat, lng: lng, id: id }
  end
end
