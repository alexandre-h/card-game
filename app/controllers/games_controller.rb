require 'rules/fight'

class GamesController < ApplicationController
  before_action :set_users_card, only: [:fight, :played_card]
  def fight
    rules = Rules::Fight.new(@gamer_one, @card_gamer_one, @gamer_two, @card_gamer_two)
    game_result = rules.attack
    p "game_result : #{game_result} ==================================="
    json_response(game_result)
  end

  private

  def set_users_card
    @gamer_one = Gamer.find(params[:gamer_one])
    @gamer_two = Gamer.find(params[:gamer_two])
    @card_gamer_one = @gamer_one.decks.order('RANDOM()').first.card
    @card_gamer_two = @gamer_two.decks.order('RANDOM()').first.card
  end
end
