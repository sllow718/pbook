require "csv"
require "pry-byebug"

Dir[Rails.root.join('db/seeds/*.rb')].sort.each do |file|
  puts "Processing #{file.split('/').last}"
  require file
end

puts "seeding dish_types now"
dish_types = ["Chicken Rice", "Laksa", "Chili Crab", "Nasi Lemak", "Roast Meat", "Nasi Biryani", "Hainanese Curry Rice", "Char Kway Teow", "Hokkien Noodles", "Oyster Omelette" , "Carrot Cake", "Roti Prata", "Fish Head Curry", "Prawn Noodles", "Bak Chor Mee ",  "Kway Chap", "Bak Kut Teh ", "Satay", "BBQ Stingray", "Rojak", "Ice Kachang ", "Curry Chicken Noodles", " Duck Rice",  "Kaya Toast", "Mee Rebus", "Mee Siam", "Mee Soto", "Oyster Omelette", "Peranakan Food", "Sambal Stingray" , "Wanton Mee", "Yong Tau Foo", "Zi CHar", "Nasi Biryani" ].sort
dish_types.each do |dish_type|
puts "creating dish_type instance for #{dish_type}"
   @new_dish_type = DishType.new(name: dish_type)
   @new_dish_type.save!
 end
 puts "finished dish_type seeding"
 puts "#{DishType.all.count} dish_types seeded"

 puts "seeding flavors now"
flavors = ["Dry" ,"Sour", "Bitter", "Smoky", "Earthy", "Scorched", "Creamy", "Rich", "Sugary", "Sweet", "Citrus", "Caramelized", "Salty", "Spicy", "Intense", "Doughy", "Juicy", "Tang"].sort
flavors.each do |flavor|
puts "creating dish_type instance for #{flavor}"
   @new_flavor = Flavor.new(name: flavor)
   @new_flavor.save!
 end
 puts "finished flavor seeding"
 puts "#{Flavor.all.count} flavors seeded"

puts "seeding completed..."
puts "thank you for your patience!"
