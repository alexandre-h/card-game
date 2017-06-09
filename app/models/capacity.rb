class Capacity < ApplicationRecord
  has_one :card

  validates_presence_of :kind
end
