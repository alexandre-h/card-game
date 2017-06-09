require 'rails_helper'

RSpec.describe Card, type: :model do
  it { should have_one(:deck) }
  it { should belong_to(:category) }
  it { should belong_to(:capacity) }
  it { should validate_presence_of(:attack) }
  it { should validate_presence_of(:defense) }
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:capacity) }
end
