require 'rails_helper'

RSpec.describe Capacity, type: :model do
  it { should have_one(:card) }
  it { should validate_presence_of(:kind) }
end
