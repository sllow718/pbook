dishes_filepath = 'lib/seeds/stalldishes.csv'

puts "seeding the dishes..."

dish_types = [
  "Chicken Rice", "Laksa", "Chili Crab", "Nasi Lemak", "Roast Meat", "Nasi Biryani",
  "Hainanese Curry Rice", "Char Kway Teow", "Hokkien Noodles", "Oyster Omelette", "Carrot Cake",
  "Roti Prata", "Fish Head Curry", "Prawn Noodles", "Bak Chor Mee", "Kway Chap", "Bak Kut Teh ",
  "Satay", "BBQ Stingray", "Rojak", "Ice Kachang", "Curry Noodles", " Duck Rice",  "Kaya Toast",
  "Mee Rebus", "Mee Siam", "Mee Soto", "Oyster Omelette", "Peranakan Food", "Sambal Stingray",
  "Wanton Mee", "Yong Tau Foo", "Zi CHar", "Nasi Biryani"
]

CSV.foreach(dishes_filepath, headers: :first_row, encoding: "UTF-8").with_index do |row, row_number|
  @dish = Dish.new
  @stall = Stall.where("name=?","#{row['stallname'].strip}")[0]
  dish_type = dish_types.sample

  case row_number
  when 0
    @dish.dish_type = "Chili Crab"
  when 1
    @dish.dish_type = "Chicken Rice"
  when 2
    @dish.dish_type = "Laksa"
  when 3
    @dish.dish_type = "Satay"
  when 4
    @dish.dish_type = "Nasi Lemak"
  when 5
    @dish.dish_type = "Fish Curry"
  when 6
    @dish.dish_type = "Roast Meat"
  when 7
    @dish.dish_type = "Indian Curry"
  when 8
    @dish.dish_type = "Nasi Biryani"
  when 9
    @dish.dish_type = "Seafood Curry"
  when 10
    @dish.dish_type = "Prawn Noodles"
  when 11
    @dish.dish_type = "Rojak"
  when 12
    @dish.dish_type = "Char Kway Teow"
  when 13
    @dish.dish_type = "Hokkien Noodles"
  when 14
    @dish.dish_type = "Mee Siam"
  when 15
    @dish.dish_type = "Oyster Omelette"
  when 16
    @dish.dish_type = "Bak Kut Teh"
  when 17
    @dish.dish_type = "Bak Chor Mee"
  when 18
    @dish.dish_type = "Hokkien Mee"
  when 19
    @dish.dish_type = "Kway Chap"
  when 20
    @dish.dish_type = "Kaya Toast"
  when 21
    @dish.dish_type = "BBQ Stingray"
  when 22
    @dish.dish_type = "Roti Prata"
  when 23
    @dish.dish_type = "Ice Kachang",
  when 24
    @dish.dish_type = "Carrot Cake"
  when 25
    @dish.dish_type = "Mee Rebus"
  else
    @dish.dish_type = dish_type
    @dish.image = row["description"]
  end

  @dish.name = row["dishname"]
  @dish.price = rand(3..5)
  if Dish.all.length <= 24
    @dish.score = rand(4.0..5.0)
  else
    @dish.score = rand(1.0..4.0)
  end

  @dish.description = "loremsss"
  @dish.stall = @stall


  @dish.save!
  puts "#{@dish.name} of #{@dish.price} from #{@dish.stall.name} is saved!"
end

puts "dishes has been populated!"
