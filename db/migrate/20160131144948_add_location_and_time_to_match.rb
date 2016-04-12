class AddLocationAndTimeToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :location_id, :integer
    add_column :matches, :time, :datetime
  end
end
