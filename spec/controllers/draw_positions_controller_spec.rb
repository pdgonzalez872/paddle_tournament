require 'rails_helper'

RSpec.describe DrawPositionsController, type: :controller do

  describe '#edit' do
    let(:path) { edit_tournament_draw_draw_position_path(tournament_id: tournament.id, draw_id: draw.id, id: draw_position.id) }
    let(:tournament) { FactoryGirl.create(:tournament, name: 'wimbledon') }
    let(:draw) { FactoryGirl.create(:draw, tournament: tournament) }
    let(:draw_position) { FactoryGirl.create(:draw_position, draw: draw) }
    let(:player) { FactoryGirl.create(:player, draw_position: draw_position) }

    it 'makes a tournament' do
      expect(tournament.name).to eq('wimbledon')
      expect(draw_position.draw.tournament.name).to eq('wimbledon')
    end

    it "renders the previous match's players" do
      get :edit, id: draw_position.id, tournament_id: tournament.id, draw_id: draw.id

      #    nokogiri
      # parse response, find css

    end
  end

end
