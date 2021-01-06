Review.destroy_all 

puts "seeding database..."
NyTimesReviews::Adapter.new.get_reviews
puts "done."