class GameHistory < ApplicationRecord
  belongs_to :winner, class_name: 'Gamer'
  belongs_to :loser, class_name: 'Gamer'
  belongs_to :winner_card, class_name: 'Card'
  belongs_to :loser_card, class_name: 'Card'
end
