# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rails/configuration'

Animal.destroy_all
User.destroy_all
Sighting.destroy_all
Comment.destroy_all


User.create(name: "Demian Sims", username: "dsound", password: "12345")
User.create(name: "Jamie Sims", username: "jsound", password: "12345")
Sighting.create(title: "On my balcony!", body: "Captured this guy on my balcony this morning. They must feed on the pigeons!", likes: 0, animal_id: 10, user_id: User.first.id)



red_tailed_hawk = AnimalApi.new("Buteo", "jamaicensis", "Red Tailed Hawk", "https://digitalmedia.fws.gov/digital/api/singleitem/image/natdiglib/11386/default.jpg?highlightTerms=red%20hawk").animal_details
coyote = AnimalApi.new("Canis", "latrans", "Coyote", "https://digitalmedia.fws.gov/digital/api/singleitem/image/natdiglib/11774/default.jpg?highlightTerms=coyote").animal_details
great_horned_owl = AnimalApi.new("Bubo", "virginianus", "Great Horned Owl", "https://digitalmedia.fws.gov/digital/api/singleitem/image/natdiglib/12828/default.jpg?highlightTerms=great%20owl").animal_details
screech_owl = AnimalApi.new("Megascops", "asio", "Eastern Screech Owl", "https://digitalmedia.fws.gov/digital/api/singleitem/image/natdiglib/7450/default.jpg?highlightTerms=Screech%20owl").animal_details
bald_eagle = AnimalApi.new("Haliaeetus", "leucocephalus", "Bald Eagle", "https://digitalmedia.fws.gov/digital/api/singleitem/image/natdiglib/28670/default.jpg?highlightTerms=bald%20eagle").animal_details
harp_seals = AnimalApi.new("Pagophilus", "groenlandicus", "Harp Seal", "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Harp_seal_pointing_upwards.jpg/220px-Harp_seal_pointing_upwards.jpg").animal_details
gray_seals = AnimalApi.new("Halichoerus", "grypus", "Grey Seal", "https://digitalmedia.fws.gov/digital/api/singleitem/image/natdiglib/10176/default.jpg?highlightTerms=gray%20seal").animal_details
virginia_opossums = AnimalApi.new("Didelphis", "virginiana", "Opossum", "https://digitalmedia.fws.gov/digital/api/singleitem/image/natdiglib/15169/default.jpg?highlightTerms=opossum").animal_details
eastern_gray_squirrel = AnimalApi.new("Sciurus", "carolinensis", "Eastern Gray Squirrel", "https://digitalmedia.fws.gov/digital/api/singleitem/image/natdiglib/10267/default.jpg?highlightTerms=eastern%20gray%20squirrel").animal_details
osprey = AnimalApi.new("Pandion", "haliaetus", "Osprey", "https://digitalmedia.fws.gov/digital/api/singleitem/image/natdiglib/11627/default.jpg?highlightTerms=osprey").animal_details
peregrine_falcon = AnimalApi.new("Falco", "peregrinus", "Peregrine Falcon", "https://digitalmedia.fws.gov/digital/api/singleitem/image/natdiglib/11211/default.jpg?highlightTerms=falcon").animal_details
piping_plovers = AnimalApi.new("Charadrius", "melodus", "Piping Plover", "https://digitalmedia.fws.gov/digital/api/singleitem/image/natdiglib/7520/default.jpg?highlightTerms=piping%20plover").animal_details
american_woodcock = AnimalApi.new("Scolopax", "minor", "American Woodcock", "https://d1ia71hq4oe7pn.cloudfront.net/photo/64829511-720px.jpg").animal_details
eastern_red_bat = AnimalApi.new("Lasiurus", "borealis", "Eastern Red Bat", "http://www.conservewildlifenj.org/images/artmax_2404.jpg").animal_details
big_brown_bat = AnimalApi.new("Eptesicus", "fuscus", "Big Brown Bat", "https://digitalmedia.fws.gov/digital/api/singleitem/image/natdiglib/18164/default.jpg?highlightTerms=big%20brown%20bat").animal_details
racoon = AnimalApi.new("Procyon", "lotor", "Racoon", "https://digitalmedia.fws.gov/digital/api/singleitem/image/natdiglib/11639/default.jpg?highlightTerms=Racoon").animal_details
spotted_salamander = AnimalApi.new("Ambystoma", "maculatum", "Spotted Salamander", "https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Spotted_Salamander%2C_Cantley%2C_Quebec.jpg/1280px-Spotted_Salamander%2C_Cantley%2C_Quebec.jpg").animal_details
spring_peepers = AnimalApi.new("Pseudacris", "crucifer", "Spring Peeper", "https://digitalmedia.fws.gov/digital/api/singleitem/image/natdiglib/17483/default.jpg?highlightTerms=spring%20peeper").animal_details
humpback_whales = AnimalApi.new("Megaptera", "novaeangliae", "Humpback Whale", "https://upload.wikimedia.org/wikipedia/commons/6/61/Humpback_Whale_underwater_shot.jpg").animal_details
canada_geese = AnimalApi.new("Branta", "canadensis", "Canada Goose", "https://digitalmedia.fws.gov/digital/api/singleitem/image/natdiglib/13106/default.jpg?highlightTerms=canada%20goose").animal_details
horseshoe_crab = AnimalApi.new("Limulus", "polyphemus", "Horseshoe Crab", "https://digitalmedia.fws.gov/digital/api/singleitem/image/natdiglib/10171/default.jpg?highlightTerms=horseshoe%20crab").animal_details
painted_turtle = AnimalApi.new("Chrysemys", "picta", "Painted Turtle", "https://digitalmedia.fws.gov/digital/api/singleitem/image/natdiglib/12972/default.jpg?highlightTerms=painted%20turtle").animal_details
white_tailed_deer = AnimalApi.new("Odocoileus", "virginianus", "White-tailed Deer", "https://digitalmedia.fws.gov/digital/api/singleitem/image/natdiglib/23729/default.jpg?highlightTerms=white%20tailed%20deer").animal_details
red_fox = AnimalApi.new("Vulpes", "vulpes", "Red Fox", "https://digitalmedia.fws.gov/digital/api/singleitem/image/natdiglib/6028/default.jpg?highlightTerms=red%20fox").animal_details
brown_rat = AnimalApi.new("Rattus", "norvegicus", "A Rat","http://www.conserveireland.com/wp-content/uploads/2018/03/1-16.jpg").animal_details
house_sparrow = AnimalApi.new("Passer", "domesticus", "Sparrow", "https://download.ams.birds.cornell.edu/api/v1/asset/63742431/1800").animal_details
