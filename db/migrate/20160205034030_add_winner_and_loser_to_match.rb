class AddWinnerAndLoserToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :winner_id, :integer
    add_column :matches, :loser_id, :integer
  end
end
