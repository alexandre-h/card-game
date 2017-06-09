require 'rails_helper'

RSpec.describe Deck, type: :model do
  it { should belong_to(:card) }
  it { should belong_to(:gamer) }
  it { should validate_presence_of(:card) }
  it { should validate_presence_of(:gamer) }
end
