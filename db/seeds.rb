# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: 'maria@email.com', password: '123456')

require 'faker'
# User.destroy_all
10.times do
  User.create!(email: Faker::Internet.email, password: Faker::Internet.password)
end

numbers = 0..3
numbers.each do |i|
  array_users = User.all
  user = array_users[i]
  array_users.slice(i)
  group = Group.create!(user: user, name: Faker::Team.name)
  Member.create!(user: user, group: group, adm: true)
  numbers.each do |j|
    member = array_users[j]
    Member.create!(user: member, group: group)
  end
end

Event.create!(
  address: "Rua A, 3, bairro Santa Maria",
  region: "Sudeste",
  price: 200.00,
  image: "https://static.cardkingdom.com/images/magic-the-gathering/dragons-maze/tithe-drinker-33674.jpg",
  description: "All incluse, área Vip, bebida que pisca, balada eletrônica",
  name: "Eletro Night",
  date: Date.new(2021, 12, 31)
)

GroupedEvent.create!(group: Group.first, event: Event.first)
