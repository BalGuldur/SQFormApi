class GamesController < ApplicationController
  def index
    @games = Game.all
    # Возвращаем все игры
    render json: { games: @games.front_view }, status: :ok
  end
end
