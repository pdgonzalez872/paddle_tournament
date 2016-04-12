class AddMatchIdToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :match_id, :integer
  end
end
