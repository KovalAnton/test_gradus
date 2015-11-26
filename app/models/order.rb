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

  filterrific(
    available_filters: [
      :with_price
    ]
  )

  has_many :orders

  scope :with_price, lambda { |price|
    where(price: [*price])
  }

  # def self.options_for_sorted_by
  #   [
  #     ['Name (a-z)', 'name_asc'],
            
  #   ]
  # end

  def self.options_for_select
    order(:price).map { |i| i.price }
  end
end
