# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

premium_user = User.create(email: "preium@gmail.com", premium: true)
peon_user = User.create(email: "low_life@gmail.com")

5.times  do |i|
  url = ShortenedUrl.create_for_user_and_long_url!(premium_user, "somelongtext#{i}")
  User.first.visit!(url)
end

other_url = ShortenedUrl.create_for_user_and_long_url!(peon_user, "somelongtextsjfkdl")
User.second.visit!(other_url)
