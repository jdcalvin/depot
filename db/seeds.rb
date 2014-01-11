# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
Product.delete_all

Product.create!(title: "Boner Machine",
								description: "So many boners, providing you with adventures to last a day.",
								image_url: 'boner.jpg',
								price: 14.59)

