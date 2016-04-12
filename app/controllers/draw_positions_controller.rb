class DrawPositionsController < ApplicationController
  def edit
    @dp             = DrawPosition.find_by(id: params[:id])
    @player_options = @dp.find_previous_match.players
  end

  def update
    tournament = Tournament.find_by(id: params[:tournament_id])
    draw       = Draw.find_by(id: params[:draw_id])
    dp         = draw.draw_positions.find_by(id: params[:id])
    match      = Draw.previous_match(draw_position: dp)
    player     = Player.find_by(id: params[:draw_position][:winner])
    match.update_score(params[:draw_position][:score])
    match.update_winner_and_loser(winner: player,
                                  player_options: params[:draw_position][:player_options])
    if dp.players << player
      redirect_to tournament_draw_path(tournament_id: tournament.id,
                                       id: draw.id)
    else
      render 'edit'
    end
  end
end
