require 'rules/capacity_calculator'

module Rules
  class Fight
    def initialize(gamer_one, card_one, gamer_two, card_two)
      @gamer_one = gamer_one
      @card_one = card_one
      @gamer_two = gamer_two
      @card_two = card_two
    end

    def attack
      card_one_data = calculate_damage @card_one, @card_two
      card_two_data = calculate_damage @card_two, @card_one
      # compare the result of the 2 cards
      attack_one = card_two_data[:defense] - card_one_data[:damage]
      attack_two = card_one_data[:defense] - card_two_data[:damage]
      if attack_one > attack_two
        GameHistory.create(winner: @gamer_one, loser: @gamer_two, winner_card: @card_one, loser_card: @card_two, description: card_one_data[:description])
        {
            winner: @gamer_one,
            card: @card_one,
            loser: @gamer_two,
            capacity_loser: @card_two.capacity.kind,
            category_loser: @card_two.category.name,
            desc: card_one_data[:description],
            capacity: @card_one.capacity.kind,
            category: @card_one.category.name,
            attack_one: attack_one,
            attack_two: attack_two

        }
      elsif attack_one < attack_two
        GameHistory.create(winner: @gamer_two, loser: @gamer_one, winner_card: @card_two, loser_card: @card_one, description: card_one_data[:description])
        {
            winner: @gamer_two,
            card: @card_two,
            loser: @gamer_one,
            capacity_loser: @card_one.capacity.kind,
            category_loser: @card_one.category.name,
            desc: card_two_data[:description],
            capacity: @card_two.capacity.kind,
            category: @card_two.category.name,
            attack_one: attack_one,
            attack_two: attack_two
        }
      else
        GameHistory.create(winner: @gamer_one, loser: @gamer_two, winner_card: @card_one, loser_card: @card_two, description: card_one_data[:description])
        {
            winner: @gamer_one,
            loser: @gamer_two,
            winner_card: @card_one,
            loser_card: @card_two,
            capacity: @card_two.capacity.kind,
            category: @card_two.category.name,
            capacity_loser: @card_one.capacity.kind,
            category_loser: @card_one.category.name,
            equality: true,
            desc: card_two_data[:description]
        }
      end
    end

    def calculate_damage(attacker, defender)
      category_defender = defender.category.name
      capacity_defender = defender.capacity.kind
      capacity = Rules::CapacityCalculator.new
      capacity.send(attacker.capacity.kind, attacker, category_defender, capacity_defender)
    end
  end
end