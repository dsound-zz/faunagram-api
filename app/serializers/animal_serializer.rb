class AnimalSerializer < ActiveModel::Serializer
  attributes :id, :name, :kingdom, :phylum, :order, :family, :genus, :species, :gname, :cls, :description, :image, :taxon_id

  has_many :sightings
  has_many :users, through: :sightings

end
