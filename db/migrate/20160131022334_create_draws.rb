class CreateDraws < ActiveRecord::Migration
  def change
    create_table :draws do |t|
      t.string  :name
      t.integer :size
      t.integer :tournament_id

      t.timestamps null: false
    end
  end
end
