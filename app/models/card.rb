class Card < ApplicationRecord
  has_one :deck
  belongs_to :category
  belongs_to :capacity

  validates_presence_of :attack, :defense, :category
end
