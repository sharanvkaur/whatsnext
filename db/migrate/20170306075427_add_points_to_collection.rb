class AddPointsToCollection < ActiveRecord::Migration[5.0]
  def change
    add_column :collections, :points, :integer, default: 0
  end
end
