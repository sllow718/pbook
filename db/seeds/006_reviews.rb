review_filepath = 'lib/seeds/stalldishes.csv'

puts "seeding the reviews..."

CSV.foreach(review_filepath, headers: :first_row, encoding: "UTF-8").with_index do |row, row_number|
  @review = Review.new
  @dish = Dish.where("name=?","#{row['dishname'].strip}")[0]
  @review.dish = @dish
  if @dish.id < 25
    @review.rating = 5.0
  else
    @review.rating = rand(1.0..4.0)
  end
  @review.comment = row["descriptionlong"]
  @review.user = User.all.sample

  @review.save!
  puts "Review rails#{@review.id} is saved!"
end

puts "review has been populated!"
