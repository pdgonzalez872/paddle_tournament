class AddInitialsToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :short_letters, :string
  end
end
