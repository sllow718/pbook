puts "seeding the reviews-flavors model..."

Review.all.length.times do |reviewid|
  3.times do
  @review = ReviewFlavor.new
  @review.review = Review.find(reviewid + 1)
  @review.flavor = Flavor.all.sample
  @review.save
  puts "#{Review.find(reviewid + 1).dish.name} saved with #{@review.flavor}"
  end
end

puts "review has been populated!"
