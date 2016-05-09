require 'rails_helper'

describe 'when I visit the edit draw position page after seeding the test database' do

  it 'displays the correct players to edit' do
    visit edit_tournament_draw_draw_position_path(tournament_id: 1, draw_id: 1, id: 16)

    expect(page).to have_text("Match #8 - Draw Position# 16")
    expect(page).to have_text("Gartzke/Schacherer")
    expect(page).to have_text("Laird/Watkins")
  end

  it 'can advance players correctly' do

    visit edit_tournament_draw_draw_position_path(tournament_id: 1, draw_id: 1, id: 16)

    select('Laird/Watkins', from: "draw_position_winner")

    fill_in "draw_position_score", with: 'Test Score'

    click_button("Update Draw position")

    visit edit_tournament_draw_draw_position_path(tournament_id: 1, draw_id: 1, id: 17)

    select('Brace/Slepian', from: "draw_position_winner")

    fill_in "draw_position_score", with: 'Test Score'

    click_button("Update Draw position")

    visit edit_tournament_draw_draw_position_path(tournament_id: 1, draw_id: 1, id: 8)

    expect(page).to have_text('Laird/Watkins')
  end

end
