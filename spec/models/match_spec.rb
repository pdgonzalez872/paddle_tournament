require 'rails_helper'

RSpec.describe Match, type: :model do

  # relies on seeded data

  it 'creates the correct class' do
    expect(Match.new).to be_instance_of described_class
  end

  context 'associations' do
    it { should belong_to(:location) }
    it { should belong_to(:draw) }
    
    it { should have_many(:draw_positions) }
    it { should have_many(:draw_positions_players) }
    it { should have_many(:players) }
  end

  context '#winner' do
  end

  context '#loser' do
  end

  context '#calculate_loser' do
  end

  context '#update_winner_and_loser' do
  end

  context '#update_score' do
  end

  context '#display_previous_match_score' do
  end

  context '#display_time' do
  end

  context '#display_location' do
  end

  context '#has_two_players?' do
  end

  context '#has_only_one_player?' do
  end

  context '#has_adjacent_players?' do
  end

  context '#no_players_are_nil?' do
  end

  context '#top_player_is_nil?' do
  end

  context 'bottom_player_is_nil?' do
  end

  context '.round' do
  end
end
