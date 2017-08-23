# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# admin = Admin.new(username: "ariefrahman", email: "arief@arief.com", password: "123123123", password_confirmation: "123123123")
player1 = User.new(first_name: 'Arief', last_name: "Rahman", team_id: 1)
player2 = User.new(first_name: 'Nara', last_name: "Hadi", team_id: 2)
player3 = User.new(first_name: 'Fachrul', last_name: "Iman", team_id: 1)
player4 = User.new(first_name: 'Josh', last_name: "Michael", team_id: 2)

team1 = Team.new(name: "God Foosball")
team2 = Team.new(name: "Foosball FC")

# admin.save!
team1.save!
team2.save!

player1.save!
player2.save!
player3.save!
player4.save!
