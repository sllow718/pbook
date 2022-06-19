dishes_filepath = 'lib/seeds/stalldishes.csv'

puts "seeding the dishes..."

dish_types = [
  "Chicken Rice", "Laksa", "Chili Crab", "Nasi Lemak", "Roast Meat", "Nasi Biryani",
  "Hainanese Curry Rice", "Char Kway Teow", "Hokkien Noodles", "Oyster Omelette", "Carrot Cake",
  "Roti Prata", "Fish Head Curry", "Prawn Noodles", "Bak Chor Mee ", "Kway Chap", "Bak Kut Teh ",
  "Satay", "BBQ Stingray", "Rojak", "Ice Kachang ", "Curry Noodles", " Duck Rice",  "Kaya Toast",
  "Mee Rebus", "Mee Siam", "Mee Soto", "Oyster Omelette", "Peranakan Food", "Sambal Stingray",
  "Wanton Mee", "Yong Tau Foo", "Zi CHar", "Nasi Biryani"
]

CSV.foreach(dishes_filepath, headers: :first_row, encoding: "UTF-8").with_index do |row, row_number|
  @dish = Dish.new
  @stall = Stall.where("name=?","#{row['stallname'].strip}")[0]
  dish_type = dish_types.sample

  case row_number
  when 0
    @dish.dish_type = "Curry Mee"
  when 1
    @dish.dish_type = "Chicken Rice"
  when 2
    @dish.dish_type = "Curry Noodles"
  when 3
    @dish.dish_type = "Chicken Laksa"
  when 4
    @dish.dish_type = "Katong Laksa"
  when 5
    @dish.dish_type = "Fish Curry"
  when 6
    @dish.dish_type = "Basil Rice"
  when 7
    @dish.dish_type = "Indian Curry"
  when 8
    @dish.dish_type = "Vegetarian Curry"
  when 9
    @dish.dish_type = "Seafood Curry"
  when 10
    @dish.dish_type = "Potato Curry"
  when 11
    @dish.dish_type = "Curry Ramen"
  when 12
    @dish.dish_type = "Coriander Curry"
  when 13
    @dish.dish_type = "Fish Laksa"
  when 14
    @dish.dish_type = "White Fish Rice"
  when 15
    @dish.dish_type = "Chives on Curry"
  when 16
    @dish.dish_type = "Fried Pork Soup"
  when 17
    @dish.dish_type = "Tom Yum"
  when 18
    @dish.dish_type = "Hokkien Mee"
  when 19
    @dish.dish_type = "Seafood Mee"
  when 20
    @dish.dish_type = "Wokhey Mee"
  when 21
    @dish.dish_type = "Sotong Mee"
  when 22
    @dish.dish_type = "Chilli Mee"
  when 23
    @dish.dish_type = "Singapore Noodles"
  when 24
    @dish.dish_type = "Limey Noodles"
  when 25
    @dish.dish_type = "Heartwarming Noodles"
  else
    @dish.dish_type = dish_type
  end

  @dish.name = row["dishname"]
  @dish.price = rand(3..5)
  if Dish.all.length <= 24
    @dish.score = 5.0
  else
    @dish.score = rand(1..4)
  end

  @dish.image = row["description"]
  @dish.description = "loremsss"
  @dish.stall = @stall


  @dish.save!
  puts "#{@dish.name} of #{@dish.price} from #{@dish.stall.name} is saved!"
end

puts "dishes has been populated!"
