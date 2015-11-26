# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do |i|
  Order.create(name: "Объявление № ##{i}", description: "Тестовое объявление", address: "Тестовый адресс", convenience: "Тестовые удобства", price: (100 + (i*10)), lat: ((i*0.1) + 55.7522222), lng: ((i*0.1) + 37.6155556), image_uid: "2015/11/26/img.jpg")
end
