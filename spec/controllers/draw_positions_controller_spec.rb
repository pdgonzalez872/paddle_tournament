require 'rails_helper'

RSpec.describe DrawPositionsController, type: :controller do

  describe '#edit' do
    let(:tournament) { FactoryGirl.create(:tournament, name: 'wimbledon') }

    it 'makes a tournament' do
      expect(tournament.name).to eq('wimbledon')
    end
  end

end
