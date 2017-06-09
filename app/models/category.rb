class Category < ApplicationRecord
  has_one :card

  validates_presence_of :name
end
