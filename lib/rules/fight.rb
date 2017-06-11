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
        {
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

  class CapacityCalculator
    def book_of_hex(attacker, category_defender, capacity_defender)
      category_attacker = attacker.category.name
      capacity_attacker = attacker.capacity.kind
      case
        # When it's two card of the same category. ex: mage vs mage
        when category_attacker == category_defender
          # When they have the same capacity. ex: livre de sort VS livre de sort
          if capacity_attacker == capacity_defender
            { damage: attacker.attack, defense: attacker.defense, description: 'equality card with the same strength' }
            # When they have different capacity. ex: livre de sort VS nothing, attack with the sort get *1.2 of damage
          elsif capacity_attacker != capacity_defender
            { damage: attacker.attack + 2, defense: attacker.defense, description: 'The mage have a capacity and not the other, +2 in attack '}
          end
        # when the cards have two different categories. ex: Mage VS Guerrier
        when category_attacker != category_defender
          # the card have different capacity, if livre de sort VS cri de guerre
          if capacity_defender
            defense = attacker.defense + 3
            { damage: attacker.attack, defense: defense, description: 'The capacity sort book add +3 in defense when fight again a warrior with war scream' }
          else
            { damage: attacker.attack + 2, defense: attacker.defense, description: 'The capacity sort book add +2 in attack when fight again a warrior without capacity' }
          end
      end

    end

    def war_cry(attacker, category_defender, capacity_defender)
      category_attacker = attacker.category.name
      capacity_attacker = attacker.capacity.kind
      case
        # When it's two card of the same category. ex: mage vs mage
        when category_attacker == category_defender
          # When they have the same capacity. ex: livre de sort VS livre de sort
          if capacity_attacker == capacity_defender
            { damage: attacker.attack, defense: attacker.defense, description: 'equality card with the same strength' }
            # When they have different capacity. ex: livre de sort VS nothing, attack with the sort get *1.2 of damage
          elsif capacity_attacker != capacity_defender
            { damage: attacker.attack + 3, defense: attacker.defense, description: 'The warrior have a capacity and not the other, +3 in attack '}
          end
        # when the cards have two different categories. ex: Mage VS Guerrier
        when category_attacker != category_defender
          # the card have different capacity, if livre de sort VS cri de guerre
          if capacity_defender
            { damage: attacker.attack + 3, defense: attacker.defense - 1, description: 'The capacity war_cry add +3 in attack when fight again a mage with book_of_hex and lose 1 in defense' }
          else
            { damage: attacker.attack + 3, defense: attacker.defense + 1, description: 'The capacity war cry add +3 in attack and +1 in defense when fight again a mage without capacity' }
          end
      end
    end

    def abracadabra(attacker, category_defender, capacity_defender)
      category_attacker = attacker.category.name
      capacity_attacker = attacker.capacity.kind
      case
        # When it's two card of the same category. ex: mage vs mage
        when category_attacker == category_defender
          # When they have the same capacity. ex: livre de sort VS livre de sort
          if capacity_attacker == capacity_defender
            { damage: attacker.attack, defense: attacker.defense, description: 'equality card with the same strength' }
            # When they have different capacity. ex: livre de sort VS nothing, attack with the sort get *1.2 of damage
          elsif capacity_attacker != capacity_defender && category_defender == 'book_of_hex'
            { damage: attacker.attack * 2, defense: attacker.defense - 3, description: 'The mage with the capacity abracadabra have double damage and lose 3 in defense against mage with book_of_hex '}
          else
            { damage: attacker.attack + 2, defense: attacker.defense + 1, description: 'The mage with abracadabra win +2 in damage and 1 in defense' }
          end
        # when the cards have two different categories. ex: Mage VS Guerrier
        when category_attacker != category_defender
          # the card have different capacity, if livre de sort VS cri de guerre
          if capacity_defender
            { damage: attacker.attack + 2, defense: attacker.defense - 1, description: 'The capacity abracadabra add +2 in attack when fight again a warrior with war_cry and lose 1 in defense' }
          else
            { damage: attacker.attack + 1, defense: attacker.defense, description: 'The capacity abracadabra add +1 in attack when fight again a warrior with war_cry' }
          end
      end
    end
  end
end