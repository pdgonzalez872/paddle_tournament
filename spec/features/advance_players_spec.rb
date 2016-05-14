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
    let(:second_match){ draw.matches.find_by(match_number: 8)  }
    let(:player_1)    { Player.find_by(name: 'Laird/Watkins') }

    context 'can advance players and allocate data correctly' do
      it 'can advance players correctly and adds winners to matches' do
        advance_winner(draw_position_id: 16, winner_name: 'Laird/Watkins')

        expect(second_match.has_only_one_player?).to be true
        expect(second_match.has_adjacent_players?).to be true
        expect(second_match.no_players_are_nil?).to be false

        advance_winner(draw_position_id: 17, winner_name: 'Brace/Slepian')

        expect(second_match.has_only_one_player?).to eq(false)

        visit edit_tournament_draw_draw_position_path(tournament_id: 1, draw_id: 1, id: 8)

        expect(page).to have_text('Laird/Watkins')
        expect(player_1.id).to eq(match.winner_id)

        visit tournament_draw_match_path(id: match.id,
                                         tournament_id: tournament.id,
                                         draw_id: draw.id)

        expect(page).to have_text("Match Details")
        expect(page).to have_text("Laird/Watkins  def	Gartzke/Schacherer")
        expect(match.winner).to eq(player_1)
        expect(second_match.has_two_players?).to eq true
        expect(second_match.top_player_is_nil?).to be false
        expect(second_match.bottom_player_is_nil?).to be false
      end
    end
  end

  def advance_winner(draw_position_id:, winner_name: )
    visit edit_tournament_draw_draw_position_path(tournament_id: 1, draw_id: 1, id: draw_position_id)

    select(winner_name, from: "draw_position_winner")
    fill_in "draw_position_score", with: 'Test Score'

    click_button("Update Draw position")
  end

end
