require 'rails_helper'

RSpec.describe DrawPosition, type: :model do
  let(:player_ex)        { Player.new(name: "Kelsey Laird") }
  let(:draw_position)    { DrawPosition.new }

  it "creates the correct class" do
    expect(draw_position).to be_instance_of described_class
  end

  context "#find_previous_match" do
    let(:current_match) {Match.new(match_number: 4)}

    xit "finds the previous match relative to draw position" do

    end
  end
end
