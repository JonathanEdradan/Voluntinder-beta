# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.destroy_all

10.times do |i|
  Event.create(
    name: "event#{i}",
    date: "02/01/2015",
    address: "225 Bush St",
    city: "San Francisco",
    state: "CA",
    zipcode: "94104",
    description: "Thank you for coming out to Event #{i}"
  )
end