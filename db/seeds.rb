# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying old records"

User.destroy_all
Game.destroy_all
Listing.destroy_all
Bid.destroy_all

runescape = Game.create(name: "RuneScape", description: "Best game ever made")
user1 = User.create(email: 'deeon@outlook.com', password: 'password')
listing1 = runescape.listings.create(title: 'SGS', description: 'big sword for 2m', status: 0, user_id: user1.id)
bid = listing1.bids.create(user_id: user1.id, listing_id: listing1.id, title: "2m for it", description: "i'll give ya 2m mate", status: 0)

worldofwarcraft = Game.create(name: "World of Warcraft", description: "Best MMORPG ever made, honestly")
user2 = User.create(email: 'donald@outlook.com', password: 'password')
listing2 = runescape.listings.create(title: 'Shard of Azzinoth', description: 'one half of a whole', status: 0, user_id: user2.id)
bid = listing2.bids.create(user_id: user2.id, listing_id: listing2.id, title: "Free?", description: "I'll give ya a high five", status: 0)

