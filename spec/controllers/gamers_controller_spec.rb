require 'rails_helper'

RSpec.describe GamersController, type: :controller do
  let(:gamer) { FactoryGirl.create(:gamer) }
  let(:gamer_id) { gamer.id }

  describe '/GET information#' do
    it 'should return gamer information' do
      get "information", params: {id: gamer_id}
      expect(json).not_to be_empty
      expect(json['name']).to eq('alexandre')
      expect(response.status).to eq 200
    end

    it 'should return an error message if game do not exist' do
      # 10 is a fake id to check the response
      get 'information', params: {id: 12}
      expect(json).not_to be_empty
      expect(json['message']).to eq("Couldn't find Gamer with 'id'=12")
      expect(response.status).to eq 404
    end
  end

  describe '/GET show_cards#' do
    it 'should return the cards for a gamer' do
      category = FactoryGirl.create(:category, name: 'mage')
      capacity = FactoryGirl.create(:capacity, kind: 'livre de sort')
      card = FactoryGirl.create(:card, capacity: capacity, category: category, attack: 12, defense: 10)
      FactoryGirl.create(:deck, card: card, gamer: gamer)

      get 'show_cards', params: {id: gamer_id}
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

    it 'should return a message if no cards for a gamer' do
      get 'show_cards', params: {id: gamer_id}
      expect(json).not_to be_empty
      expect(json['message']).to eq('No Deck associated to the user')
      expect(response.status).to eq 404
    end
  end
end
