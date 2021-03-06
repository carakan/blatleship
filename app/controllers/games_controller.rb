class GamesController < ApplicationController
  def index
    GameSingleton.instance.game = Game.new
    redirect_to :back
  end

  def show
    if params[:cords]
      cords = params[:cords].split(",").map(&:to_i)
      result = GameSingleton.instance.game.play(params[:id].to_i, cords[0], cords[1])
    end
  end
end
