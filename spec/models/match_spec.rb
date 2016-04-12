require 'rails_helper'

RSpec.describe Match, type: :model do
  let(:match) { Match.create!() }

  it 'creates the correct class' do
    expect(match).to be_instance_of described_class
  end

end
