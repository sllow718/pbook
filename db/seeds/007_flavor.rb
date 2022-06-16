puts "seeding flavors now"
flavors = ["Dry" ,"Sour", "Bitter", "Smoky", "Earthy", "Scorched", "Creamy", "Rich", "Sugary", "Sweet", "Citrus", "Caramelized", "Salty", "Spicy", "Intense", "Doughy", "Juicy", "Tang"].sort
flavors.each do |flavor|
puts "creating dish_type instance for #{flavor}"
   new_flavor = Flavor.new(name: flavor)
   new_flavor.save!
 end
 puts "finished flavor seeding"
 puts "#{Flavor.all.count} flavors seeded"
