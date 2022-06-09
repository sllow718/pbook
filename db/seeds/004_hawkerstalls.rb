# Hawker Stalls seeding
hawkerstall_filepath = 'lib/seeds/hawkerstall.csv'
puts "Seeding the stalls..."
CSV.foreach(hawkerstall_filepath, headers: :first_row) do |row|
  @stall = Stall.new
  # binding.pry
  @hawkercenter = HawkerCenter.where("name=?", "#{row['hawkercenter']}")[0]
  @stall.name = row["name"].strip
  # binding.pry
  @stall.unit = row["unit"].strip.to_s
  @stall.hawker_center = @hawkercenter
  @stall.user = User.all.sample
  @stall.description = "placeholder"
  # binding.pry
  @stall.save
  puts "#{row['name']}, #{row['unit']} at #{@hawkercenter.name} has been saved!"
end
puts "Stalls has been seeded"
