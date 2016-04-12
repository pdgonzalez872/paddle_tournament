class AddPreviousMatchScoreToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :previous_match_score, :string
  end
end
