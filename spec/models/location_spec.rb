require 'rails_helper'

RSpec.describe Location, type: :model do
  let(:location) do
    Location.create!(name:    'Winnetka',
                     address: 'Chub Road')
  end

  it 'creates a correct class' do
    expect(location).to be_instance_of described_class
  end
end
