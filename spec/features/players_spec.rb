require 'rails_helper'

describe 'Players feature' do

  it 'notifies the customer that it will be implemented soon' do
    visit players_path

    expect(page).to have_text("This feature will be implemented soon!!")
  end
end
