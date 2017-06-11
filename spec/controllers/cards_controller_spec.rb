require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  let(:category)  { FactoryGirl.create(:category, name: 'mage') }
  let(:capacity) { FactoryGirl.create(:capacity, kind: 'livre de sort') }
  let(:card) { FactoryGirl.create(:card, capacity: capacity, category: category, attack: 12, defense: 10) }
  let(:card_id) { card.id }

  describe "GET #index" do
    it 'should return all the card' do
      card.reload
      get 'index'
      expect(json.size).to eq(1)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      card.reload
      get 'show', params: {id: card_id}
      expect(json['attack']).to eq(12)
      expect(json['defense']).to eq(10)
    end
  end
end
