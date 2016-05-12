require 'rails_helper'

RSpec.describe DrawPosition, type: :model do
  let(:player)           { Player.new(name: 'Kelsey Laird') }
  let(:draw_position)    { DrawPosition.new }

  it 'creates the correct class' do
    expect(draw_position).to be_instance_of described_class
  end

  context 'Associations' do
    it { should belong_to(:match) }
    it { should belong_to(:draw) }

    it { should have_many(:draw_positions_players) }
    it { should have_many(:players) }
  end

  context '#has_player' do
    it 'has a player' do
      draw_position.players << player
      expect(draw_position.players.first).to eq player
      expect(draw_position.has_player?).to eq false
    end
  end

  context '#previous_match_score' do
  end

  context '#find_previous_match' do
  end

  context '#fix_human_error' do
  end
end
