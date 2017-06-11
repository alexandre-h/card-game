# spec/factories/decks.rb
FactoryGirl.define do
  factory :deck do
    card
    gamer
  end
end