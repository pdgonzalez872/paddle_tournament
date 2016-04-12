class MatchesController < ApplicationController
  def show
    @match = Match.find(params[:id])
  end

  def index
    @matches = Match.all
  end
end
