require 'rails_helper'

RSpec.describe DrawPositionsController, type: :controller do

  xdescribe '#edit' do
    it 'is successful' do
      get edit_tournament_draw_draw_position_path(id: 1,
                                                            draw_id: 1,
                                                            tournament_id: 1)

      expect(response).to render_template(:edit)
    end
  end

  describe 'update' do

  end
end
