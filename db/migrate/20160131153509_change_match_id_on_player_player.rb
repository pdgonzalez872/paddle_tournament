class ChangeMatchIdOnPlayerPlayer < ActiveRecord::Migration
  def change
    add_column :players, :current_draw_position, :integer
  end
end
