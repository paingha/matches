# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
             email: "example@railstutorial5.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true)

User.create!(
             email: "example@railstutorial24.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true)

User.create!(
             email: "example@railstutorial38.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true)

User.create!(
             email: "example@railstutorial47.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true)

users = User.all
user  = users.first
receiver = users[2..5]
givers = users[3..6]
receiver.each { |receiver| user.match(receiver) }
givers.each { |giver| giver.match(user) }