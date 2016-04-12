class CreateDrawPositions < ActiveRecord::Migration
  def change
    create_table :draw_positions do |t|
      t.integer :match_id
      t.integer :draw_id

      t.timestamps null: false
    end
  end
end
