class DrawPositionsPlayer < ActiveRecord::Base
  belongs_to :player
  belongs_to :draw_position
end
