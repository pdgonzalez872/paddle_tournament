require 'rails_helper'

describe 'Draws' do

  let(:tournament) { Tournament.find_by(id: 1) }

  it 'displays all draws for a tournament' do
    visit tournament_path(id: tournament.id)

    expect(page).to have_text("Tournament Draws")
    expect(page).to have_text("Main")
    expect(page).to have_text("Consolation")
    expect(page).to have_text("Last Chance")
    expect(page).to have_text("Quarter Reprieve")
    expect(page).to have_text("Reprieve")
  end

  it 'displays all tournaments' do
    visit tournaments_path

    expect(page).to have_text('Tournaments')
    expect(page).to have_text("Weekend Women's Tournament")
  end
end
