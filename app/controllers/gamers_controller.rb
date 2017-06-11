class GamersController < ApplicationController
  before_action :set_gamer, only: [:information, :show_cards]

  def information
    json_response(@gamer)
  end

  def show_cards
    @deck = @gamer.decks
    @deck.empty? ? json_response({message: 'No Deck associated to the user'}, :not_found) : json_response(@deck.to_json(:include => :card))
  end

  private

  def set_gamer
    @gamer = Gamer.find(params[:id])
  end
end
