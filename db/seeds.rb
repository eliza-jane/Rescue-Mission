# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

10.times do
  User.create(username: Faker::LordOfTheRings.unique.character)
end

12.times do
  Question.create(title: Faker::StarWars.quote, body: Faker::Hipster.sentence(20), user_id: rand(1..10))
end

20.times do
  Answer.create(body: Faker::Hipster.sentence(50), question_id: rand(1..12), user_id: rand(1..10))
end
