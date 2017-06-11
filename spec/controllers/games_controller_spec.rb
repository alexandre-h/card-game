require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe '/POST fight#' do
    it 'should return fight information' do
      post "fight", params: {gamer_one: gamer_id}
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
end
