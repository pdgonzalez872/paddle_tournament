require 'rails_helper'

RSpec.describe DrawPosition, type: :model do

  # relies on seeded data
  let(:main_draw)              { Draw.find(1) }
  let(:player)                 { Player.find_by(name: 'Laird/Watkins') }

  let(:first_round_draw_position) do
    main_draw.draw_positions.find_by(draw_positions_number: 32)
  end

  let(:second_round_first_round_draw_position) do
    main_draw.draw_positions.find_by(draw_positions_number: 16)
  end

  let(:first_match) do
    main_draw.matches.find_by(match_number: 16)
  end

  it 'creates the correct class' do
    expect(first_round_draw_position).to be_instance_of described_class
  end

  context 'Associations' do
    it { should belong_to(:match) }
    it { should belong_to(:draw) }

    it { should have_many(:draw_positions_players) }
    it { should have_many(:players) }
  end

  # TODO: current coverage is 76.0%. Increase this

  context '#has_player' do
    it 'has a player' do
      # TODO: change this method to return true.
      # this is a bad implementation. It should return true if it has a player

      expect(first_round_draw_position.players).to include player
      expect(first_round_draw_position.has_player?).to eq false
    end
  end

  # TODO: this is very coupled together. this class knows too much. Need an organizer/manager class for this
  context '#find_previous_match' do
    it 'has a relationship with its Match parent' do
      result = second_round_first_round_draw_position.draw_positions_number
      expect(result).to eq first_match.match_number
    end

    it 'can find its previous match' do
      result = second_round_first_round_draw_position.find_previous_match
      expect(result).to eq first_match
    end
  end

  # This method is used here: app/views/matches/_match.html.erb
  context '#previous_match_score' do
    it 'can find the previous match score' do
      score = '6/1 6/1'
      first_match.update_score(score)
      result = second_round_first_round_draw_position.previous_match_score

      expect(result).to eq score
    end
  end

  context '#fix_human_error' do
    it 'allows the user to correct a bad input' do
      second_round_first_round_draw_position.players << Player.new(name: 'Bad input')
      second_round_first_round_draw_position.fix_human_error(player_id: player.id)

      expect(first_match.winner).to eq(player)
    end
  end
end
