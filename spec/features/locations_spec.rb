require 'rails_helper'

describe 'Locations information page' do

  let(:winnetka) { Location.find_by(name: 'Winnetka') }

  it 'displays locations with their correct address' do
    visit locations_path

    expect(page).to have_text(winnetka.name)
    expect(page).to have_text(winnetka.address)
  end

  it 'can display information about the location, but this is not implemented yet' do
    visit location_path(id: winnetka.id)

    expect(page).to have_text(winnetka.name)
  end
end
