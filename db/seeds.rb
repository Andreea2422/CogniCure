# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Create a main sample user.
# User.create!(name: "Example User",
#              email: "example@railstutorial.org",
#              password: "foobar",
#              password_confirmation: "foobar",
#              doctor: true)
#
# # Generate a bunch of additional users.
# 10.times do |n|
#   name = Faker::Name.name
#   email = "example-#{n+1}@gmail.org"
#   password = "password"
#   User.create!(name: name,
#                email: email,
#                password: password,
#                password_confirmation: password)
# end

# Generate infos for a subset of users.
users = User.order(created_at: :desc).take(6)
n=10
users.each do |user|
  biography = Faker::Lorem.sentence(word_count: 5)
  speciality = ["Psychotherapy"]
  experience = "#{n+1} years"
  contact = ["#{n+1000} #{n+5000} #{n+6000}","job@clinic.com"]
  user.create_info!(biography: biography,
                    speciality: speciality,
                    experience: experience,
                    contact: contact)
  n=n+1
end
