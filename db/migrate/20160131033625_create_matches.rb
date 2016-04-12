class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :position_1
      t.integer :position_2
      t.integer :draw_id

      t.timestamps null: false
    end
  end
end
