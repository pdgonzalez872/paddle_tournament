class RemovePositionIntMatches < ActiveRecord::Migration
  def change
    remove_column :matches, :position_1
    remove_column :matches, :position_2
  end
end
