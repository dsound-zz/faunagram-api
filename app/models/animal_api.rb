class AnimalApi
  include HTTParty
  # base_uri "http://api.gbif.org"

    attr_accessor :genus, :species, :gname, :image

    def initialize(genus, species, gname, image)
      self.genus = genus
      self.species = species
      self.gname = gname
      self.image = image
    end

    def animal_details

      response = self.class.get("http://api.gbif.org/v1/species?name=#{self.genus}%20#{self.species}&limit=1")
      result = response["results"].map do |r|
        Animal.create(
          kingdom: r["kingdom"],
          phylum: r["phylum"],
          order: r["order"],
          family: r["family"],
          genus: r["genus"],
          species: r["species"],
          cls: r["class"],
          name: r["vernacularName"],
          gname: self.gname,
          taxon_id: r["sourceTaxonKey"],
          image: self.image
      )
    end
        result
    end



end
