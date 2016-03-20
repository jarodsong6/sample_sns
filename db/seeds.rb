# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "Example User",
             email: "sample.sns@gmail.com",
             password:              "foobarfoobar",
             password_confirmation: "foobarfoobar")

user = User.first
50.times do
  content = Faker::Lorem.sentence(5)
  user.posts.create!(content: content)
end
