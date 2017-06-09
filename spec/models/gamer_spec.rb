require 'rails_helper'

RSpec.describe Gamer, type: :model do
  it { should have_many(:decks) }
  it { should validate_presence_of(:name) }
end
