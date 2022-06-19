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
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/chilli_crab.jpg'),
      filename: "chilli_crab.jpg",
      content_type: "photo/jpg"
    )
  when 1
    @dish.dish_type = "Chicken Rice"
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/chicken_rice.jpg'),
      filename: "chicken_rice.jpg",
      content_type: "photo/jpg"
    )
  when 2
    @dish.dish_type = "Laksa"
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/laksa.jpg'),
      filename: "laksa.jpg",
      content_type: "photo/jpg"
    )
  when 3
    @dish.dish_type = "Satay"
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/satay.jpg'),
      filename: "satay.jpg",
      content_type: "photo/jpg"
    )
  when 4
    @dish.dish_type = "Nasi Lemak"
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/nasi_lemak.jpg'),
      filename: "nasi_lemak.jpg",
      content_type: "photo/jpg"
    )
  when 5
    @dish.dish_type = "Fish Curry"
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/fish_curry.jpg'),
      filename: "fish_curry.jpg",
      content_type: "photo/jpg"
    )
  when 6
    @dish.dish_type = "Roast Meat"
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/roast_meat.jpg'),
      filename: "roast_meat.jpg",
      content_type: "photo/jpg"
    )
  when 7
    @dish.dish_type = "Wanton Noodles"
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/wanton_noodles.jpg'),
      filename: "wanton_noodles.jpg",
      content_type: "photo/jpg"
    )
  when 8
    @dish.dish_type = "Nasi Biryani"
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/nasi_biryani.jpg'),
      filename: "nasi_biryani.jpg",
      content_type: "photo/jpg"
    )
  when 9
    @dish.dish_type = "Orh Nee"
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/orh_nee.jpg'),
      filename: "orh_nee.jpg",
      content_type: "photo/jpg"
    )
  when 10
    @dish.dish_type = "Prawn Noodles"
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/prawn_noodles.jpg'),
      filename: "prawn_noodles.jpg",
      content_type: "photo/jpg"
    )
  when 11
    @dish.dish_type = "Rojak"
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/rojak.jpg'),
      filename: "rojak.jpg",
      content_type: "photo/jpg"
    )
  when 12
    @dish.dish_type = "Char Kway Teow"
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/char_kuay_teow.jpg'),
      filename: "char_kuay_teow.jpg",
      content_type: "photo/jpg"
    )
  when 13
    @dish.dish_type = "Hokkien Noodles"
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/hokkien_noodles.jpg'),
      filename: "hokkien_noodles.jpg",
      content_type: "photo/jpg"
    )
  when 14
    @dish.dish_type = "Mee Siam"
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/mee_siam.jpg'),
      filename: "mee_siam.jpg",
      content_type: "photo/jpg"
    )
  when 15
    @dish.dish_type = "Oyster Omelette"
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/oyster_omelette.jpg'),
      filename: "oyster_omelette.jpg",
      content_type: "photo/jpg"
    )
  when 16
    @dish.dish_type = "Bak Kut Teh"
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/bak_kut_teh.jpg'),
      filename: "bak_kut_teh.jpg",
      content_type: "photo/jpg"
    )
  when 17
    @dish.dish_type = "Bak Chor Mee"
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/bak_chor_mee.jpg'),
      filename: "bak_chor_mee.jpg",
      content_type: "photo/jpg"
    )
  when 18
    @dish.dish_type = "Thosai"
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/thosai.jpg'),
      filename: "thosai.jpg",
      content_type: "photo/jpg"
    )
  when 19
    @dish.dish_type = "Kway Chap"
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/kway_chap.jpg'),
      filename: "kway_chap.jpg",
      content_type: "photo/jpg"
    )
  when 20
    @dish.dish_type = "Kaya Toast"
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/kaya_toast.jpg'),
      filename: "kaya_toast.jpg",
      content_type: "photo/jpg"
    )
  when 21
    @dish.dish_type = "BBQ Stingray"
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/bbq_stingray.jpg'),
      filename: "bbq_stingray.jpg",
      content_type: "photo/jpg"
    )
  when 22
    @dish.dish_type = "Roti Prata"
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/roti_prata.jpg'),
      filename: "roti_prata.jpg",
      content_type: "photo/jpg"
    )
  when 23
    @dish.dish_type = "Ice Kachang"
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/ice_kachang.jpg'),
      filename: "ice_kachang.jpg",
      content_type: "photo/jpg"
    )
  when 24
    @dish.dish_type = "Carrot Cake"
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/carrot_cake.jpg'),
      filename: "carrot_cake.jpg",
      content_type: "photo/jpg"
    )
  when 25
    @dish.dish_type = "Mee Rebus"
    @dish.photo.attach(
      io: File.open('app/assets/images/seeds/mee_rebus.jpg'),
      filename: "mee_rebus.jpg",
      content_type: "photo/jpg"
    )
  else
    @dish.dish_type = dish_type
    @dish.image = row["description"]
  end

  @dish.name = row["dishname"]
  @dish.price = rand(3..5)
  if Dish.all.length <= 24
    @dish.score = rand(4.00...5.00)
  else
    @dish.score = rand(1.00..4.00)
  end

  @dish.description = "loremsss"
  @dish.stall = @stall


  @dish.save!
  puts "#{@dish.name} of #{@dish.price} from #{@dish.stall.name} is saved!"
end

puts "dishes has been populated!"
