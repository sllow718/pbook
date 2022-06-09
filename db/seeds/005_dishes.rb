dishes_filepath = 'lib/seeds/stalldishes.csv'

puts "seeding the dishes..."

CSV.foreach(dishes_filepath, headers: :first_row) do |row|
  @dish = Dish.new
  # binding.pry
  @stall = Stall.where("name=?","#{row['stallname'].strip}")[0]
  @dish.name = row["dishname"]
  @dish.price = rand(3..5)
  @dish.description = row["description"]
  @dish.stall = @stall

  @dish.save
  puts "#{@dish.name} of #{@dish.price} from #{@dish.stall.name} is saved!"
end

puts "dishes has been populated!"
