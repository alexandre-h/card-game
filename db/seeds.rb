# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'create two players'
gamer_one = Gamer.create!(name: 'Alexandre')
gamer_two = Gamer.create!(name: 'Bob')
p 'players created'

p 'create categories'
category_one = Category.create!(name: 'mage')
category_two = Category.create!(name: 'warrior')
p '2 categories created : '
p "- #{category_one.name} #{category_one.id}"
p "- #{category_two.name} #{category_two.id}"

p 'create capacity'
capacity_one = Capacity.create!(kind: 'book_of_hex')
capacity_two = Capacity.create!(kind: 'war_cry')
capacity_three = Capacity.create!(kind: 'abracadabra')

p 'create cards'
card_mage_one = Card.create!(attack: 10, defense: 14, category: category_one, capacity: capacity_one)
card_warrior = Card.create!(attack: 13, defense: 13, category: category_two, capacity: capacity_two)
card_mage_two = Card.create!(attack: 11, defense: 10, category: category_one, capacity: capacity_three)

p 'create deck for 2 users'
Deck.create!(gamer: gamer_one, card: card_mage_one)
Deck.create!(gamer: gamer_one, card: card_warrior)
Deck.create!(gamer: gamer_two, card: card_warrior)
Deck.create!(gamer: gamer_two, card: card_mage_two)