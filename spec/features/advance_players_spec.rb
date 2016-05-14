require 'rails_helper'

describe 'when I visit the edit draw position page after seeding the test database' do

  it 'displays the correct players to edit' do
    visit edit_tournament_draw_draw_position_path(tournament_id: 1, draw_id: 1, id: 16)

    expect(page).to have_text("Match #8 - Draw Position# 16")
    expect(page).to have_text("Gartzke/Schacherer")
    expect(page).to have_text("Laird/Watkins")
  end

  context 'has the main feature available' do

    let(:tournament)  { Tournament.find_by(id: draw.tournament.id) }
    let(:draw)        { Draw.find(1) }
    let(:match)       { draw.matches.find_by(match_number: 16) }
    let(:player_1)    { Player.find_by(name: 'Laird/Watkins') }

    it 'can advance players correctly and adds winners to matches' do
      advance_winner(draw_position_id: 16, winner_name: 'Laird/Watkins')
      advance_winner(draw_position_id: 17, winner_name: 'Brace/Slepian')

      visit edit_tournament_draw_draw_position_path(tournament_id: 1, draw_id: 1, id: 8)

      expect(page).to have_text('Laird/Watkins')
      expect(player_1.id).to eq(match.winner_id)

      visit tournament_draw_match_path(id: match.id,
                                       tournament_id: tournament.id,
                                       draw_id: draw.id)

      expect(page).to have_text("Match Details")
      expect(page).to have_text("Laird/Watkins  def	Gartzke/Schacherer")
      expect(match.winner).to eq(player_1)

    end
  end

  def advance_winner(draw_position_id:, winner_name: )
    visit edit_tournament_draw_draw_position_path(tournament_id: 1, draw_id: 1, id: draw_position_id)

    select(winner_name, from: "draw_position_winner")
    fill_in "draw_position_score", with: 'Test Score'

    click_button("Update Draw position")
  end

end
