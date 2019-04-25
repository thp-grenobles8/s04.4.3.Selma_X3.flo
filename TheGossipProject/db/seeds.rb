# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# remise à zéro des tables
print "clear User:"
User.destroy_all
puts " ✔"
print "clear City:"
City.destroy_all
puts " ✔"
print "clear Tag:"
Tag.destroy_all
puts " ✔"
print "clear JoinTableGossipTagable:"
JoinTableGossipTag.destroy_all
puts " ✔"
print "clear Gossip:"
Gossip.destroy_all
puts " ✔"
print "clear PrivateMessage:"
PrivateMessage.destroy_all
puts " ✔"
print "clear JoinTablePrivateMessageUser:"
JoinTablePrivateMessageUser.destroy_all
puts " ✔"
print "clear Comment:"
Comment.destroy_all
puts " ✔"
print "clear Like:"
Like.destroy_all
puts " ✔ \n\n"


# création des tables
print 'create City'
10.times do |index|
  City.create(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  )
end
puts " ✔"

print 'create User'
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
puts " ✔"

print 'create Gossip'
20.times do |index|
  Gossip.create(
    title: Faker::Book.title,
    content: Faker::Lorem.words(25).join(' ').capitalize,
    user: User.all.sample
  )
end
puts " ✔"

print 'create Tag'
10.times do |index|
  Tag.create(
    title: Faker::Book.genre
  )
end
puts " ✔"

print 'create JoinTableGossipTag'
Gossip.all.each do |g|
  t = rand(1..5)
  t.times do |index|
    JoinTableGossipTag.create(
        gossip: g,
        tag: Tag.all.sample
    )
  end
end
puts " ✔"

print 'create PrivateMessage'
10.times do |index|
  PrivateMessage.create(
    content: Faker::Lorem.words(30).join(' ').capitalize,
    sender: User.all.sample
  )
end
puts " ✔"

print 'create JoinTablePrivateMessageUser'
PrivateMessage.all.each do |pm|
  r = rand(1..5)
  r.times do |index|
    JoinTablePrivateMessageUser.create(
      private_message: pm,
      recipient: User.all.sample
    )
  end
end
puts " ✔"

print 'create Comment'
20.times do |index|
  Comment.create(
    author: User.all.sample,
    gossip: Gossip.all.sample,
    content: Faker::Lorem.words(15).join(' ').capitalize
  )
end
puts " ✔"

print 'create Like'
20.times do |index|
  is_gossip = [true, false].sample

  if is_gossip
    Like.create(
      gossip: Gossip.all.sample,
      user: User.all.sample
    )
  else
    Like.create(
      comment: Comment.all.sample,
      user: User.all.sample
    )
  end
end
puts " ✔"
