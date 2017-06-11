namespace :game do
  desc "Run a game and display"
  task run: :environment do
    p 'Welcome in the game'
    p 'First presentation of the two gamers'
    uri = URI('http://localhost:3000/gamers/1/information')
    response = Net::HTTP.get(uri)
    gamer_one = JSON.parse(response)
    p "The first gamer is #{gamer_one['name']}"
    p "#{gamer_one['name']}(gamer one) have the card:  "
    uri = URI('http://localhost:3000/gamers/1/show_cards')
    response = Net::HTTP.get(uri)
    decks_one = JSON.parse(response)
    decks_one.each do |card|
      category = Category.find card['card']['category_id'].to_i
      capacity = Capacity.find card['card']['capacity_id'].to_i
      p " - #{category.name} with the capacity #{capacity.kind} "
    end

    uri = URI('http://localhost:3000/gamers/2/information')
    response = Net::HTTP.get(uri)
    gamer_two = JSON.parse(response)
    p "The second gamer is #{gamer_two['name']}"
    p "#{gamer_two['name']}(gamer one) have the card:  "
    uri = URI('http://localhost:3000/gamers/2/show_cards')
    response = Net::HTTP.get(uri)
    decks_one = JSON.parse(response)
    decks_one.each do |card|
      category = Category.find card['card']['category_id'].to_i
      capacity = Capacity.find card['card']['capacity_id'].to_i
      p " - #{category.name} with the capacity #{capacity.kind} "
    end


    p 'start the first game'
    uri = URI('http://localhost:3000/games/fight/1/2')
    response = Net::HTTP.get(uri)
    match_one = JSON.parse(response)
    p match_one
    p "The Gamer one played a card of category #{match_one['category']} with the capacity #{match_one['capacity']}"
    p "The Gamer Two played a card of category #{match_one['category_loser']} with the capacity #{match_one['capacity_loser']}"
    if match_one['equality']
      p "Equality : The player played the same card "
    else
      p "the player #{match_one['winner']['name']} won the game with the card #{match_one['category']} with the capacity #{match_one['capacity']} because #{match_one['desc']}"
    end



    p 'start the second game'
    uri = URI('http://localhost:3000/games/fight/1/2')
    response = Net::HTTP.get(uri)
    match_one = JSON.parse(response)
    if match_one['equality']
      p "Equality : The player played the same card "
    else
      p "The Gamer one played a card of category #{match_one['category']} with the capacity #{match_one['capacity']}"
      p "The Gamer Two played a card of category #{match_one['category_loser']} with the capacity #{match_one['capacity_loser']}"
      p "the player #{match_one['winner']['name']} won the game with the card #{match_one['category']} with the capacity #{match_one['capacity']} because #{match_one['desc']}"
    end
    p 'start the third game'
    uri = URI('http://localhost:3000/games/fight/1/2')
    response = Net::HTTP.get(uri)
    match_one = JSON.parse(response)
    if match_one['equality']
      p "Equality : The player played the same card "
    else
      p "The Gamer one played a card of category #{match_one['category']} with the capacity #{match_one['capacity']}"
      p "The Gamer Two played a card of category #{match_one['category_loser']} with the capacity #{match_one['capacity_loser']}"
      p "the player #{match_one['winner']['name']} won the game with the card #{match_one['category']} with the capacity #{match_one['capacity']} because #{match_one['desc']}"
    end
  end

end
