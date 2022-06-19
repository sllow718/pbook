flavours = %w[light fluffy savoury salty umami eggy mild]
demo_flavours = []
flavours.each do |flavour|
  new_flavour = Flavor.create!(name: flavour)
  demo_flavours << new_flavour
end

carrot_cake_1 = Dish.new
carrot_cake_1.name = "Crisp Carrot Cake"
carrot_cake_1.price = rand(3..6)
carrot_cake_1.dish_type = "Carrot Cake"
carrot_cake_1.description = "Covered in a crispy layer of egg that is sure to please"
carrot_cake_1.stall_id = Stall.all.sample.id
carrot_cake_1.photo.attach(
    io: File.open('app/assets/images/seed_demo/carrot_cake_1.jpg'),
    filename: "carrot_cake_1.jpg",
    content_type: "photo/jpg"
  )
carrot_cake_1.save!

carrot_cake_2 = Dish.new
carrot_cake_2.name = "Silky Carrot Cake"
carrot_cake_2.price = rand(3..6)
carrot_cake_2.dish_type = "Carrot Cake"

carrot_cake_2.description = "Finest texture, smooth like silk"
carrot_cake_2.stall_id = Stall.all.sample.id
carrot_cake_2.photo.attach(
    io: File.open('app/assets/images/seed_demo/carrot_cake_2.jpg'),
    filename: "carrot_cake_2.jpg",
    content_type: "photo/jpg"
  )
carrot_cake_2.save!

carrot_cake_3 = Dish.new
carrot_cake_3.name = "Carrot Cake Sedap"
carrot_cake_3.price = rand(3..6)
carrot_cake_3.dish_type = "Carrot Cake"

carrot_cake_3.description = "Specialty recipe with a malay twist. Halal certified."
carrot_cake_3.stall_id = Stall.all.sample.id
carrot_cake_3.photo.attach(
    io: File.open('app/assets/images/seed_demo/carrot_cake_3.jpg'),
    filename: "carrot_cake_3.jpg",
    content_type: "photo/jpg"
  )
carrot_cake_3.save!

carrot_cake_4 = Dish.new
carrot_cake_4.name = "White Carrot Cake"
carrot_cake_4.price = rand(3..6)
carrot_cake_4.dish_type = "Carrot Cake"

carrot_cake_4.description = "Classic. Perfect balance of salt of radish"
carrot_cake_4.stall_id = Stall.all.sample.id
carrot_cake_4.photo.attach(
    io: File.open('app/assets/images/seed_demo/carrot_cake_4.jpg'),
    filename: "carrot_cake_4.jpg",
    content_type: "photo/jpg"
  )
carrot_cake_4.save!

carrot_cake_5 = Dish.new
carrot_cake_5.name = "Carrot Cake Magic"
carrot_cake_5.price = rand(3..6)
carrot_cake_5.dish_type = "Carrot Cake"

carrot_cake_5.description = "Feel the difference with our homemade Cai Poh. Amazing Carrot Cake."
carrot_cake_5.stall_id = Stall.all.sample.id
carrot_cake_5.photo.attach(
    io: File.open('app/assets/images/seed_demo/carrot_cake_5.jpg'),
    filename: "carrot_cake_5.jpg",
    content_type: "photo/jpg"
  )
carrot_cake_5.save!

carrot_cake_6 = Dish.new
carrot_cake_6.name = "BLK5 Carrot Cake"
carrot_cake_6.price = rand(3..6)
carrot_cake_6.dish_type = "Carrot Cake"

carrot_cake_6.description = "50 year old recipe guarantees deliciousness"
carrot_cake_6.stall_id = Stall.all.sample.id
carrot_cake_6.photo.attach(
    io: File.open('app/assets/images/seed_demo/carrot_cake_6.jpg'),
    filename: "carrot_cake_6.jpg",
    content_type: "photo/jpg"
  )
carrot_cake_6.save!

carrot_cake_7 = Dish.new
carrot_cake_7.name = "Carrot Cake"
carrot_cake_7.price = rand(3..6)
carrot_cake_7.dish_type = "Carrot Cake"

carrot_cake_7.description = "Nothing fancy but honest cooking and love"
carrot_cake_7.stall_id = Stall.all.sample.id
carrot_cake_7.photo.attach(
    io: File.open('app/assets/images/seed_demo/carrot_cake_7.jpeg'),
    filename: "carrot_cake_7.jpeg",
    content_type: "photo/jpeg"
  )
carrot_cake_7.save!

carrot_cake_8 = Dish.new
carrot_cake_8.name = "XO Carrot Cake"
carrot_cake_8.price = rand(3..6)
carrot_cake_8.dish_type = "Carrot Cake"

carrot_cake_8.description = "Singaporean soul food with a Cantonese twist"
carrot_cake_8.stall_id = Stall.all.sample.id
carrot_cake_8.photo.attach(
    io: File.open('app/assets/images/seed_demo/carrot_cake_8.jpeg'),
    filename: "carrot_cake_8.jpeg",
    content_type: "photo/jpeg"
  )
carrot_cake_8.save!

carrot_cake_9 = Dish.new
carrot_cake_9.name = "Classic Carrot Cake"
carrot_cake_9.price = rand(3..6)
carrot_cake_9.dish_type = "Carrot Cake"

carrot_cake_9.description = "The taste of the 20s, nostalgia for sure"
carrot_cake_9.stall_id = Stall.all.sample.id
carrot_cake_9.photo.attach(
    io: File.open('app/assets/images/seed_demo/carrot_cake_9.jpg'),
    filename: "carrot_cake_9.jpg",
    content_type: "photo/jpg"
  )
carrot_cake_9.save!

carrot_cake_10 = Dish.new
carrot_cake_10.name = "Carrot Cake Supreme"
carrot_cake_10.price = rand(3..6)
carrot_cake_10.dish_type = "Carrot Cake"

carrot_cake_10.description = "The ultimate decadence. Sinfully oily"
carrot_cake_10.stall_id = Stall.all.sample.id
carrot_cake_10.photo.attach(
    io: File.open('app/assets/images/seed_demo/carrot_cake_10.jpeg'),
    filename: "carrot_cake_10.jpeg",
    content_type: "photo/jpeg"
  )
carrot_cake_10.save!

User.first(10).each do |user|
  Dish.where(dish_type: "Carrot Cake").each do |dish|
    review = Review.new
    review.comment = "I like the dish"
    review.rating = rand(1.2..4.9)
    review.user = user
    review.dish = dish
    review.save!
    puts "#{dish.name}-#{review.rating}-#{user.username}"

    demo_flavours.sample(3).each do |flavour|
      ReviewFlavor.create!(review: review, flavor: flavour)
    end
  end
end
