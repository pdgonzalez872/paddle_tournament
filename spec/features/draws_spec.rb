require 'rails_helper'

describe 'Draws' do

  let(:draw) { Draw.find_by(id: 1) }

  it 'displays the edit draw page correctly' do
    visit edit_tournament_draw_path(tournament_id: draw.tournament.id,
                                    id:            draw.id)
    expect(page).to have_text("Edit Weekend Women's Tournament - Main")
  end
end
