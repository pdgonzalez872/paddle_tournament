require 'rails_helper'

RSpec.describe Draw, type: :model do
  let(:draw)  { Draw.create(name: 'Main', size: 32) }
  let(:match) { draw.matches.find_by(match_number: 31) }

  context 'associations' do
    it { should belong_to(:tournament) }

    it { should have_many(:matches) }
    it { should have_many(:draw_positions) }
    it { should have_many(:players) }
  end

  it 'creates the correct class' do
    expect(draw).to be_instance_of described_class
  end

  context 'Creates the correct structure' do
    it 'draw has the correct draw positions' do
      result = draw.draw_positions.count
      expect(result).to eq 63
    end

    it 'draw has the correct number of matches to be played' do
      result = draw.matches.count
      expect(result).to eq 31
    end

    context 'creates matches with the correct draw_positions' do
      context 'final' do
        it 'creates the final correctly' do
          result = draw.matches.first.name
          expect(result).to eq 'final'
        end

        it 'final has correct draw_positions' do
          first = draw.matches.first.draw_positions.first
          last = draw.matches.first.draw_positions.last

          expect(first.draw_positions_number).to eq 2
          expect(last.draw_positions_number).to eq 3
        end
      end

      context 'First match for seed #2' do
        it 'creates the match in the correct round' do
          expect(match.name).to eq 'sixty_four'
        end
        it 'creates the correct draw_positions for the match' do
          first = match.draw_positions.first
          last = match.draw_positions.last

          expect(first.draw_positions_number).to eq 62
          expect(last.draw_positions_number).to eq 63
        end
      end
    end
  end

  context '#draw_positions_count' do
    it 'returns the correct number of draw positions for a draw' do
      expect(draw.draw_positions_count).to eq(63)
    end
  end

  context '#matches_count' do
    it "displays the relationship between matches and the draw's size" do
      expect(draw.matches_count).to eq(31)
    end
  end

  context 'these are too hard to test by themselves' do
    context '#create_draw_structure'
    context '.default_rounds'
    context '#create_draw_positions'
  end
end
