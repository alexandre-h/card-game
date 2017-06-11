class CardsController < ApplicationController
 before_action  :set_card, only: [:show]
  def index
    @cards = Card.all
    json_response(@cards)
  end

  def show
    json_response(@card)
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end
end
