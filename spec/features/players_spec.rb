require 'rails_helper'

describe 'Players feature' do

  let(:player_1) { Player.find_by(name: 'Laird/Watkins') }

  it 'notifies the customer that it will be implemented soon' do
    visit players_path

    expect(page).to have_text("This feature will be implemented soon!!")
  end

  it 'displays the players matches' do
    visit player_path(id: player_1.id)

    expect(page).to have_text(player_1.name)
  end
end
