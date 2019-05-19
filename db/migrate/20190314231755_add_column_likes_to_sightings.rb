class AddColumnLikesToSightings < ActiveRecord::Migration[5.2]
  def change
    add_column :sightings, :likes, :integer
  end
end
