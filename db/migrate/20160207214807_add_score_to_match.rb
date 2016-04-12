class AddScoreToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :score, :string
  end
end
