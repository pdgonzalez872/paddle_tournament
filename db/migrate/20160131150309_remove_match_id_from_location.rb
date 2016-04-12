class RemoveMatchIdFromLocation < ActiveRecord::Migration
  def change
    remove_column :locations, :match_id, :integer
  end
end
  
