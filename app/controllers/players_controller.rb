class PlayersController < ApplicationController

  def index
  end

  def show
    @player = Player.find_by(id: params[:id])
  end
end
