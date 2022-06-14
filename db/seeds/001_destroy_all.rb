puts "destroying database..."

print `rails db:drop`
print `rails db:create`
print `rails db:migrate`

puts "destruction completed"
puts "proceeding to seed now!"
