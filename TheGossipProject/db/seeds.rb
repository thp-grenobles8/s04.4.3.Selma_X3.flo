# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
puts "clear User: done"
City.destroy_all
puts "clear City: done"
Tag.destroy_all
puts "clear Tag: done"
JoinTableGossipTag.destroy_all
puts "clear JoinTableGossipTagable: done"
Gossip.destroy_all
puts "clear Gossip: done"
PrivateMessage.destroy_all
puts "clear PrivateMessage: done"
JoinTablePrivateMessageUser.destroy_all
puts "clear JoinTablePrivateMessageUser: done"

puts 'create City'
10.times do |index|
  City.create(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  )
end

puts 'create User'
10.times do |index|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.words(30).join(" ").capitalize,
    email: Faker::Internet.email,
    age: rand(20..40),
    city: City.all.sample
  )
end

puts 'create Gossip'
20.times do |index|
  Gossip.create(
    title: Faker::Book.title,
    content: Faker::Lorem.words(25).join(' ').capitalize,
    user: User.all.sample
  )
end

puts 'create Tag'
10.times do |index|
  Tag.create(
    title: Faker::Book.genre
  )
end

puts 'create JoinTableGossipTag'
Gossip.all.each do |g|
  t = rand(1..5)
  t.times do |index|
    JoinTableGossipTag.create(
        gossip: g,
        tag: Tag.all.sample
    )
  end
end

puts 'create PrivateMessage'
10.times do |index|
  PrivateMessage.create(
    content: Faker::Lorem.words(30).join(' ').capitalize,
    sender: User.all.sample
  )
end

puts 'create JoinTablePrivateMessageUser'
PrivateMessage.all.each do |pm|
  r = rand(1..5)
  r.times do |index|
    JoinTablePrivateMessageUser.create(
      private_message: pm,
      recipient: User.all.sample
    )
  end
end
