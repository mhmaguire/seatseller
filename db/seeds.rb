# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'ffaker'

%w(seller pass1 pass2 pass3).each do |name|
	User.find_or_create_by_email!(email: "#{name}@seatseller.com", password: 'password', password_confirmation: 'password')	
end

seller = User.first

time = DateTime.now

5.times do 
	seller.trips.create!(title: Faker::Lorem.sentence, destination: Faker::Address.city, start: Faker::Address.city, available_seats: 3, departure_time: time)
	time += 4.days
end
