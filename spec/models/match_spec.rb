require 'rails_helper'

RSpec.describe Match, type: :model do

  # relies on seeded data

  let(:draw)        { Draw.find(1) }
  let(:first_match) { draw.matches.find_by(match_number: 16) }
  let(:second_match) { draw.matches.find_by(match_number: 8) }
  let(:player_options) { "[{\"id\":1,\"name\":\"Laird/Watkins\",\"email\":null,\"phone_number\":null,\"created_at\":\"2016-05-14T21:05:15.703Z\",\"updated_at\":\"2016-05-14T21:05:15.703Z\",\"current_draw_position\":null,\"draw_position_id\":null},{\"id\":2,\"name\":\"Gartzke/Schacherer\",\"email\":null,\"phone_number\":null,\"created_at\":\"2016-05-14T21:05:15.722Z\",\"updated_at\":\"2016-05-14T21:05:15.722Z\",\"current_draw_position\":null,\"draw_position_id\":null}]" }
  let(:player_1)    { Player.find_by(name: 'Laird/Watkins') }
  let(:player_2)    { Player.find_by(name: 'Gartzke/Schacherer') }

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

  context 'winners and losers' do

    before do
      first_match.update_winner_and_loser(winner: player_1, player_options: player_options)
    end

    context '#winner' do
      it 'returns the winner of a match' do
        expect(first_match.winner).to eq player_1
      end
    end

    context '#loser' do
      it 'returns the loser of a match' do
        expect(first_match.loser).to eq player_2
      end
    end

    context '#update_winner_and_loser' do
      it 'allocates data correctly' do
        expect(first_match.winner).to eq player_1
        expect(first_match.loser).to eq player_2
      end
    end
    context '#update_score' do
      it 'updates the score correctly' do
        expect(first_match.score).to eq(nil)
        first_match.update_score('6/1 6/1')
        expect(first_match.score).to eq('6/1 6/1')
      end
    end
  end

  context 'state' do

    let(:dummy_match) { Match.new }

    context '#display_time' do
      it 'displays time in the proper format' do
        expect(first_match.display_time).to eq('12:00')
      end

      it 'does not display time if none is given' do
        expect(dummy_match.display_time).to eq('?')
      end
    end

    context '#display_location' do
      it 'displays location correctly' do
        expect(first_match.display_location).to eq('GVC')
      end

      it 'does not display the location if none is given' do
        expect(dummy_match.display_location).to eq('?')
      end
    end
  end

  context 'too many dependencies' do
    # This model has a lot of dependencies and these features are tested here:
    # spec/features/advance_players_spec.rb
    context '#has_two_players?'
    context '#has_only_one_player?'
    context '#has_adjacent_players?'
    context '#no_players_are_nil?'
    context '#top_player_is_nil?'
    context '#bottom_player_is_nil?'
  end


  context '.round' do
    it 'fetches matches based on round name' do
      result = Match.round('final')
      expect(result.length).to eq(5)
    end
  end
end
