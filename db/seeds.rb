# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#  create users
User.create(name: "caleb")
User.create(name: "joe")
User.create(name: "jim")
User.create(name: "jane")
User.create(name: "joe")
User.create(name: "jim")
User.create(name: "jane")
User.create(name: "joe")

House.create(title: "Gryffindor", user_id: 1)
House.create(title: "Slytherin", user_id: 2)
House.create(title: "Ravenclaw", user_id: 3)
House.create(title: "Hufflepuff", user_id: 4)
