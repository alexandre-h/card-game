require 'colorize'

namespace :game do
  desc "Run a game and display"
  task run: :environment do
    puts 'Welcome in the game'.magenta
    puts 'Let me introduce you the two gamers and their decks'.magenta
    sleep(4)
    uri = URI('http://localhost:3000/gamers/1/information')
    response = Net::HTTP.get(uri)
    gamer_one = JSON.parse(response)
    puts "The first gamer is #{gamer_one['name']}".blue
    puts "#{gamer_one['name'].capitalize} have the cards:".blue
    uri = URI('http://localhost:3000/gamers/1/show_cards')
    response = Net::HTTP.get(uri)
    decks_one = JSON.parse(response)
    decks_one.each do |card|
      category = Category.find card['card']['category_id'].to_i
      capacity = Capacity.find card['card']['capacity_id'].to_i
      puts " - #{category.name} with the capacity #{capacity.kind} ".blue
    end

    sleep(10)

    uri = URI('http://localhost:3000/gamers/2/information')
    response = Net::HTTP.get(uri)
    gamer_two = JSON.parse(response)
    puts "The second gamer is #{gamer_two['name']}".yellow
    puts "#{gamer_two['name'].capitalize} have the cards:".yellow
    uri = URI('http://localhost:3000/gamers/2/show_cards')
    response = Net::HTTP.get(uri)
    decks_one = JSON.parse(response)
    decks_one.each do |card|
      category = Category.find card['card']['category_id'].to_i
      capacity = Capacity.find card['card']['capacity_id'].to_i
      puts " - #{category.name} with the capacity #{capacity.kind} ".yellow
    end

    sleep(8)

    puts "Let's start the first game".magenta
    sleep(4)
    uri = URI('http://localhost:3000/games/fight/1/2')
    response = Net::HTTP.get(uri)
    match_one = JSON.parse(response)
    puts "The Gamer one, #{match_one['winner']['name'].capitalize}, played a card of category #{match_one['category']} with the capacity #{match_one['capacity']}".blue
    puts "The Gamer two, #{match_one['loser']['name'].capitalize}, played a card of category #{match_one['category_loser']} with the capacity #{match_one['capacity_loser']}".yellow
    sleep(5)
    if match_one['equality']
      puts "Equality : The player played the same card ".red
    else
      puts "The player #{match_one['winner']['name'].capitalize} won the game with the card #{match_one['category']} with the capacity #{match_one['capacity']} because #{match_one['desc']}".green
    end

    sleep(7)

    puts 'start the second game'.magenta
    sleep(4)
    uri = URI('http://localhost:3000/games/fight/1/2')
    response = Net::HTTP.get(uri)
    match_one = JSON.parse(response)
    puts "The Gamer one, #{match_one['winner']['name'].capitalize},  played a card of category #{match_one['category']} with the capacity #{match_one['capacity']}".blue
    puts "The Gamer two, #{match_one['loser']['name'].capitalize},  played a card of category #{match_one['category_loser']} with the capacity #{match_one['capacity_loser']}".yellow
    sleep(5)
    if match_one['equality']
      puts "Equality : The player played the same card ".red
    else
      puts "the player #{match_one['winner']['name'].capitalize} won the game with the card #{match_one['category']} with the capacity #{match_one['capacity']} because #{match_one['desc']}".green
    end

    sleep(7)

    puts 'start the third game'.magenta
    sleep(4)
    uri = URI('http://localhost:3000/games/fight/1/2')
    response = Net::HTTP.get(uri)
    match_one = JSON.parse(response)
    puts "The Gamer one, #{match_one['winner']['name']},  played a card of category #{match_one['category']} with the capacity #{match_one['capacity']}".blue
    puts "The Gamer two, #{match_one['loser']['name']},  played a card of category #{match_one['category_loser']} with the capacity #{match_one['capacity_loser']}".yellow
    sleep(5)
    if match_one['equality']
      puts "Equality : The player played the same card ".red
    else
      puts "the player #{match_one['winner']['name']} won the game with the card #{match_one['category']} with the capacity #{match_one['capacity']} because #{match_one['desc']}".green
    end

    sleep(10)

    puts "Let's see the Game History for the gamer:".magenta
    uri = URI('http://localhost:3000/game_histories/1/gamer_victory_history')
    response = Net::HTTP.get(uri)
    full_history = JSON.parse(response)
    puts "Here all victories history for the gamer one #{full_history['gamer']['name'].capitalize} with the cards".blue
    sleep(3)
    full_history['history'].each do |history|
      card = Card.find history['winner_card_id'].to_i
      puts " - #{card.category.name} and capacity #{card.capacity.kind}, #{history['description']} ".green
      sleep(1)
    end

    sleep(5)

    uri = URI('http://localhost:3000/game_histories/1/gamer_defeat_history')
    response = Net::HTTP.get(uri)
    full_history = JSON.parse(response)
    puts "Here all defeats history for the gamer one #{full_history['gamer']['name'].capitalize} with the cards".blue
    sleep(3)
    full_history['history'].each do |history|
      card = Card.find history['loser_card_id'].to_i
      puts " - #{card.category.name} and capacity #{card.capacity.kind}, #{history['description']} ".red
      sleep(1)
    end

    uri = URI('http://localhost:3000/game_histories/2/gamer_victory_history')
    response = Net::HTTP.get(uri)
    full_history = JSON.parse(response)
    puts "Here all victories history for the gamer two #{full_history['gamer']['name'].capitalize} with the cards".yellow
    sleep(3)
    full_history['history'].each do |history|
      card = Card.find history['winner_card_id'].to_i
      puts " - #{card.category.name} and capacity #{card.capacity.kind}, #{history['description']} ".green
      sleep(1)
    end

    sleep(5)

    uri = URI('http://localhost:3000/game_histories/2/gamer_defeat_history')
    response = Net::HTTP.get(uri)
    full_history = JSON.parse(response)
    puts "Here all defeats history for the gamer two #{full_history['gamer']['name'].capitalize} with the cards".yellow
    sleep(3)
    full_history['history'].each do |history|
      card = Card.find history['loser_card_id'].to_i
      puts " - #{card.category.name} and capacity #{card.capacity.kind}, #{history['description']} ".red
      sleep(1)
    end
  end
end
