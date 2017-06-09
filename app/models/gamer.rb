class Gamer < ApplicationRecord
  has_many :decks

  validates_presence_of :name
end
