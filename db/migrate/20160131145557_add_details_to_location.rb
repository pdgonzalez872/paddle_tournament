class AddDetailsToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :name, :string
    add_column :locations, :address, :string
  end
end
