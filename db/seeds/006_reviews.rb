review_filepath = 'lib/seeds/stalldishes.csv'

puts "seeding the reviews..."

CSV.foreach(review_filepath, headers: :first_row) do |row|
  @review = Review.new
  # binding.pry
  @dish = Dish.where("name=?","#{row['dishname'].strip}")[0]
  @review.dish = @dish
  @review.rating = rand(1..5)
  @review.comment = row["descriptionlong"]
  @review.user = User.all.sample

  @review.save
  puts "Review rails#{@review.id} is saved!"
end

puts "review has been populated!"
