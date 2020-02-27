class CardsController < ApplicationController
  # load_resource will find the card i select and create a variable @card
 load_resource :card

  def index
    @cards = Card.all
    json_response(@cards)
  end

  def show
    json_response(@card)
  end
end
