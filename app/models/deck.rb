class Deck < ApplicationRecord
  belongs_to :card
  belongs_to :gamer

  validates_presence_of :card, :gamer
end
