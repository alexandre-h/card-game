class GameHistoriesController < ApplicationController
  before_action :set_gamer
  def gamer_all_history
    @history = GameHistory.where(winner_id: params[:id]).or(GameHistory.where(loser_id: params[:id]))
    data = { gamer: @gamer, history: @history }
    json_response(data)
  end

  def gamer_victory_history
    @history = GameHistory.where(winner_id: params[:id])
    data = { gamer: @gamer, history: @history }
    json_response(data)
  end

  def gamer_defeat_history
    @history = GameHistory.where(loser_id: params[:id])
    data = { gamer: @gamer, history: @history }
    json_response(data)
  end

  private

  def set_gamer
    @gamer = Gamer.find(params[:id])
  end
end
