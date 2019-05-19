class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :kingdom
      t.string :phylum
      t.string :order
      t.string :family
      t.string :genus
      t.string :species
      t.string :cls
      t.string :gname
      t.string :description
      t.integer :taxon_id
      t.string :image 

      t.timestamps
    end
  end
end
