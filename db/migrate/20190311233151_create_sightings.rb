class CreateSightings < ActiveRecord::Migration[5.2]
  def change
    create_table :sightings do |t|

    t.string :title
    t.string :body
    t.integer :user_id
    t.integer :animal_id

    t.timestamps
    end
  end
end
