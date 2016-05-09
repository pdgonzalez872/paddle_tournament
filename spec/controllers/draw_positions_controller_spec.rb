require 'rails_helper'

RSpec.describe DrawPositionsController, type: :controller do

  describe '#edit' do
    # let(:path) { edit_tournament_draw_draw_position_path(tournament_id: tournament.id, draw_id: draw.id, id: draw_position.id) }
    # let(:tournament) { FactoryGirl.create(:tournament, name: 'wimbledon') }
    # let(:draw) { FactoryGirl.create(:draw, tournament: tournament) }
    # let(:draw_position) { FactoryGirl.create(:draw_position, draw: draw) }
    #
    # let(:player1) { FactoryGirl.create(:player,name: 'player_1', draw_position: draw_position) }
    # let(:player2) { FactoryGirl.create(:player,name: 'player_1', draw_position: draw_position) }
    #
    # it 'makes a tournament' do
    #   expect(tournament.name).to eq('wimbledon')
    #   expect(draw_position.draw.tournament.name).to eq('wimbledon')
    # end

    # xit "renders the previous match's players" do
    #   # get :edit, id: draw_position.id, tournament_id: tournament.id, draw_id: draw.id
    #
    #   #    nokogiri
    #   # parse response, find css
    # end

    # let(:player_1) { Player.find_by(name: "Laird/Watkins") }
    # let(:player_2) { Player.find_by(name: "Gartzke/Schacherer") }

    let(:first_draw_position)  { DrawPosition.find(16) }

    # needs to seed the database first
    xit 'seeding the db for test' do
      visit root_path

      expect(true).to be true

      # get(:edit, tournament_id: 1, draw_id: 1, id: 16)

      # page = Nokogiri::HTML(response)

      # p page
      # require 'pry'; binding.pry

      # expect(page.body).to have_text("Match #8 - Draw Position# 16")

      #   #    nokogiri
      #   # parse response, find css
    end
  end

end
