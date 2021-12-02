# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require "open-uri"

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

GroupedEvent.create!(group: Group.first, event: Event.first)

Event.destroy_all

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath = '/home/campos1984/code/AnaPaula0712/Qual-vai-ser/db/reveillon_nordeste5.csv'

CSV.foreach(filepath, csv_options) do |row|
  file = URI.open(row[7].split("url('")[1].slice(0...-5))
  event = Event.create!(
    name: row[4],
    address: row[6],
    region: "Nordeste",
    date: row[5],
    price: row[8],
    description: row[9]
  )
  event.photo.attach(io: file, filename: 'photo.png', content_type: 'image/png')
end
