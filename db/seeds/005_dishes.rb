dishes_filepath = 'lib/seeds/stalldishes.csv'

puts "seeding the dishes..."

dish_types = ["Chicken Rice", "Laksa", "Chili Crab", "Nasi Lemak", "Roast Meat", "Nasi Biryani", "Hainanese Curry Rice", "Char Kway Teow", "Hokkien Noodles", "Oyster Omelette" , "Carrot Cake", "Roti Prata", "Fish Head Curry", "Prawn Noodles", "Bak Chor Mee ",  "Kway Chap", "Bak Kut Teh ", "Satay", "BBQ Stingray", "Rojak", "Ice Kachang ", "Curry Noodles", " Duck Rice",  "Kaya Toast", "Mee Rebus", "Mee Siam", "Mee Soto", "Oyster Omelette", "Peranakan Food", "Sambal Stingray" , "Wanton Mee", "Yong Tau Foo", "Zi CHar", "Nasi Biryani" ]

CSV.foreach(dishes_filepath, headers: :first_row, encoding: "UTF-8").with_index do |row, row_number|
  @dish = Dish.new
  @stall = Stall.where("name=?","#{row['stallname'].strip}")[0]
  dish_type = dish_types.sample
  @dish.name = row["dishname"]
  @dish.price = rand(3..5)
  if row_number < 24
    @dish.score = 5 - (row_number *= 0.01)
  else
    @dish.score = rand(1..4)
  end
  @dish.image = row["description"]
  @dish.description = "loremsss"
  @dish.stall = @stall
  @dish.dish_type = dish_type

  @dish.save!
  puts "#{@dish.name} of #{@dish.price} from #{@dish.stall.name} is saved!"
end

puts "dishes has been populated!"
