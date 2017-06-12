# Define the rules for each capacity
module Rules
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
          elsif capacity_attacker != capacity_defender && capacity_defender == 'book_of_hex'
            { damage: attacker.attack + 2, defense: attacker.defense + 1, description: 'The mage have capacity abracadabra and the other book_of_hex, add +2 in attack and +1 in defense'}
          elsif capacity_attacker != capacity_defender && capacity_defender == 'abracadabra'
            { damage: attacker.attack + 2, defense: attacker.defense + 2, description: 'The mage have capacity book_of_hex and the other abracadabra, add +2 in attack and +2 in defense'}
          else
            { damage: attacker.attack + 2, defense: attacker.defense, description: 'The capacity add + 2 in attack' }
          end
        # when the cards have two different categories. ex: Mage VS Guerrier
        when category_attacker != category_defender
          # the card have different capacity, if livre de sort VS cri de guerre
          if capacity_defender
            defense = attacker.defense + 3
            { damage: attacker.attack, defense: defense, description: 'The capacity book_of_hex add +3 in defense when fight again a warrior with war cry' }
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
            { damage: attacker.attack + 3, defense: attacker.defense, description: 'The warrior have a capacity and not the other, +3 in attack' }
          end
        # when the cards have two different categories. ex: Mage VS Guerrier
        when category_attacker != category_defender
          # the card have different capacity, if livre de sort VS cri de guerre
          if capacity_defender && capacity_defender == 'book_of_hex'
            { damage: attacker.attack + 3, defense: attacker.defense - 1, description: 'The capacity war_cry add +3 in attack and lose 1 in defense when fight again a mage with book_of_hex' }
          elsif capacity_defender && capacity_defender == 'abracadabra'
            { damage: attacker.attack + 2, defense: attacker.defense - 1, description: 'The capacity war_cry add +2 in attack and lose 1 in defense when fight again a mage with abracadabra' }
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