puts "destroying database..."
User.destroy_all
HawkerCenter.destroy_all
Stall.destroy_all
puts "destruction completed"
puts "proceeding to seed now!"
