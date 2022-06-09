 # HawkerCenter seeding
 hawkercenter_filepath = 'lib/seeds/hawkercenter.csv'
 puts "Seeding Hawkercenters..."
 CSV.foreach(hawkercenter_filepath, headers: :first_row) do |row|
   @hawkercenter = HawkerCenter.new
   @hawkercenter.name = row["name"]
   @hawkercenter.address = row["address"]
   @hawkercenter.save
   puts "#{row["name"]}, #{row["address"]} saved!"
 end
 puts "Hawker Centers successfully seeded!"
