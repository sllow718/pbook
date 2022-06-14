require "csv"
# require "pry-byebug"

Dir[Rails.root.join('db/seeds/*.rb')].sort.each do |file|
  puts "Processing #{file.split('/').last}"
  require file
end

puts "seeding completed..."
puts "thank you for your patience!"
