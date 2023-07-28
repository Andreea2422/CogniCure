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
# users = User.order(created_at: :desc).take(6)
# n=10
# users.each do |user|
#   biography = Faker::Lorem.sentence(word_count: 5)
#   speciality = ["Psychotherapy"]
#   experience = "#{n+1} years"
#   contact = ["#{n+1000} #{n+5000} #{n+6000}","job@clinic.com"]
#   user.create_info!(biography: biography,
#                     speciality: speciality,
#                     experience: experience,
#                     contact: contact)
#   n=n+1
# end


SituationChoice.destroy_all
UserChoice.destroy_all
Situation.destroy_all
Choice.destroy_all

# Reset the ID sequence of the 'your_table_name' table to start from 1
ActiveRecord::Base.connection.execute("ALTER SEQUENCE choices_id_seq RESTART WITH 1")
ActiveRecord::Base.connection.execute("ALTER SEQUENCE situations_id_seq RESTART WITH 1")
ActiveRecord::Base.connection.execute("ALTER SEQUENCE situation_choices_id_seq RESTART WITH 1")
ActiveRecord::Base.connection.execute("ALTER SEQUENCE user_choices_id_seq RESTART WITH 1")

puts "seeding situations..."
# ID_MOOD RED-1 BLUE-2 YELLOW-3

situation_red1 = Situation.create(name: "situation_red1", story_text: "SITUATION RED 1", id_mood: 1)
situation_red2a = Situation.create(name: "situation_red2a", story_text: "SITUATION RED 2A", id_mood: 1)
situation_red2b = Situation.create(name: "situation_red2b", story_text: "SITUATION RED 2B", id_mood: 1)
situation_red3aa = Situation.create(name: "situation_red3aa", story_text: "SITUATION RED 3AA", id_mood: 1)
situation_red3ab = Situation.create(name: "situation_red3ab", story_text: "SITUATION RED 3AB", id_mood: 1)
situation_red3ba = Situation.create(name: "situation_red3ba", story_text: "SITUATION RED 3BA", id_mood: 1)
situation_red3bb = Situation.create(name: "situation_red3bb", story_text: "SITUATION RED 3BB", id_mood: 1)

situation_blue1 = Situation.create(name: "situation_blue1", story_text: "SITUATION BLUE 1", id_mood: 2)
situation_blue2a = Situation.create(name: "situation_blue2a", story_text: "SITUATION BLUE 2A", id_mood: 2)
situation_blue2b = Situation.create(name: "situation_blue2b", story_text: "SITUATION BLUE 2B", id_mood: 2)
situation_blue3aa = Situation.create(name: "situation_blue3aa", story_text: "SITUATION BLUE 3AA", id_mood: 2)
situation_blue3ab = Situation.create(name: "situation_blue3ab", story_text: "SITUATION BLUE 3AB", id_mood: 2)
situation_blue3ba = Situation.create(name: "situation_blue3ba", story_text: "SITUATION BLUE 3BA", id_mood: 2)
situation_blue3bb = Situation.create(name: "situation_blue3bb", story_text: "SITUATION BLUE 3BB", id_mood: 2)

situation_yellow1 = Situation.create(name: "situation_yellow1", story_text: "SITUATION YELLOW 1", id_mood: 3)
situation_yellow2a = Situation.create(name: "situation_yellow2a", story_text: "SITUATION YELLOW 2A", id_mood: 3)
situation_yellow2b = Situation.create(name: "situation_yellow2b", story_text: "SITUATION YELLOW 2B", id_mood: 3)
situation_yellow3aa = Situation.create(name: "situation_yellow3aa", story_text: "SITUATION YELLOW 3AA", id_mood: 3)
situation_yellow3ab = Situation.create(name: "situation_yellow3ab", story_text: "SITUATION YELLOW 3AB", id_mood: 3)
situation_yellow3ba = Situation.create(name: "situation_yellow3ba", story_text: "SITUATION YELLOW 3BA", id_mood: 3)
situation_yellow3bb = Situation.create(name: "situation_yellow3bb", story_text: "SITUATION YELLOW 3BB", id_mood: 3)

puts "seeding choices"
choice_red0 = Choice.create(name: "choice_red0", choice_text: "CHOICE RED 0", id_mood: 1)
choice_blue0 = Choice.create(name: "choice_blue0", choice_text: "CHOICE BLUE 0", id_mood: 2)
choice_yellow0 = Choice.create(name: "choice_yellow0", choice_text: "CHOICE YELLOW 0", id_mood: 3)

choice_red1a = Choice.create(name: "choice_red1a", choice_text: "CHOICE RED 1A", id_mood: 1)
choice_red1b = Choice.create(name: "choice_red1b", choice_text: "CHOICE RED 1B", id_mood: 1)
choice_red2aa = Choice.create(name: "choice_red2aa", choice_text: "CHOICE RED 2AA", id_mood: 1)
choice_red2ab = Choice.create(name: "choice_red2ab", choice_text: "CHOICE RED 2AB", id_mood: 1)
choice_red2ba = Choice.create(name: "choice_red2ba", choice_text: "CHOICE RED 2BA", id_mood: 1)
choice_red2bb = Choice.create(name: "choice_red2bb", choice_text: "CHOICE RED 2BB", id_mood: 1)

choice_blue1a = Choice.create(name: "choice_blue1a", choice_text: "CHOICE BLUE 1A", id_mood: 2)
choice_blue1b = Choice.create(name: "choice_blue1b", choice_text: "CHOICE BLUE 1B", id_mood: 2)
choice_blue2aa = Choice.create(name: "choice_blue2aa", choice_text: "CHOICE BLUE 2AA", id_mood: 2)
choice_blue2ab = Choice.create(name: "choice_blue2ab", choice_text: "CHOICE BLUE 2AB", id_mood: 2)
choice_blue2ba = Choice.create(name: "choice_blue2ba", choice_text: "CHOICE BLUE 2BA", id_mood: 2)
choice_blue2bb = Choice.create(name: "choice_blue2bb", choice_text: "CHOICE BLUE 2BB", id_mood: 2)

choice_yellow1a = Choice.create(name: "choice_yellow1a", choice_text: "CHOICE YELLOW 1A", id_mood: 3)
choice_yellow1b = Choice.create(name: "choice_yellow1b", choice_text: "CHOICE YELLOW 1B", id_mood: 3)
choice_yellow2aa = Choice.create(name: "choice_yellow2aa", choice_text: "CHOICE YELLOW 2AA", id_mood: 3)
choice_yellow2ab = Choice.create(name: "choice_yellow2ab", choice_text: "CHOICE YELLOW 2AB", id_mood: 3)
choice_yellow2ba = Choice.create(name: "choice_yellow2ba", choice_text: "CHOICE YELLOW 2BA", id_mood: 3)
choice_yellow2bb = Choice.create(name: "choice_yellow2bb", choice_text: "CHOICE YELLOW 2BB", id_mood: 3)

puts "seeding situation_choices..."
SituationChoice.create(choice: choice_red0, situation: situation_red1, outcome: false)
SituationChoice.create(choice: choice_blue0, situation: situation_blue1, outcome: false)
SituationChoice.create(choice: choice_yellow0, situation: situation_yellow1, outcome: false)

# RED
SituationChoice.create(choice: choice_red1a, situation: situation_red1, outcome: true)
SituationChoice.create(choice: choice_red1b, situation: situation_red1, outcome: true)
SituationChoice.create(choice: choice_red1a, situation: situation_red2a, outcome: false)
SituationChoice.create(choice: choice_red1b, situation: situation_red2b, outcome: false)

SituationChoice.create(choice: choice_red2aa, situation: situation_red2a, outcome: true)
SituationChoice.create(choice: choice_red2ab, situation: situation_red2a, outcome: true)
SituationChoice.create(choice: choice_red2ba, situation: situation_red2b, outcome: true)
SituationChoice.create(choice: choice_red2bb, situation: situation_red2b, outcome: true)

SituationChoice.create(choice: choice_red2aa, situation: situation_red3aa, outcome: false)
SituationChoice.create(choice: choice_red2ab, situation: situation_red3ab, outcome: false)
SituationChoice.create(choice: choice_red2ba, situation: situation_red3ba, outcome: false)
SituationChoice.create(choice: choice_red2bb, situation: situation_red3bb, outcome: false)

# BLUE
SituationChoice.create(choice: choice_blue1a, situation: situation_blue1, outcome: true)
SituationChoice.create(choice: choice_blue1b, situation: situation_blue1, outcome: true)
SituationChoice.create(choice: choice_blue1a, situation: situation_blue2a, outcome: false)
SituationChoice.create(choice: choice_blue1b, situation: situation_blue2b, outcome: false)

SituationChoice.create(choice: choice_blue2aa, situation: situation_blue2a, outcome: true)
SituationChoice.create(choice: choice_blue2ab, situation: situation_blue2a, outcome: true)
SituationChoice.create(choice: choice_blue2ba, situation: situation_blue2b, outcome: true)
SituationChoice.create(choice: choice_blue2bb, situation: situation_blue2b, outcome: true)

SituationChoice.create(choice: choice_blue2aa, situation: situation_blue3aa, outcome: false)
SituationChoice.create(choice: choice_blue2ab, situation: situation_blue3ab, outcome: false)
SituationChoice.create(choice: choice_blue2ba, situation: situation_blue3ba, outcome: false)
SituationChoice.create(choice: choice_blue2bb, situation: situation_blue3bb, outcome: false)

# YELLOW
SituationChoice.create(choice: choice_yellow1a, situation: situation_yellow1, outcome: true)
SituationChoice.create(choice: choice_yellow1b, situation: situation_yellow1, outcome: true)
SituationChoice.create(choice: choice_yellow1a, situation: situation_yellow2a, outcome: false)
SituationChoice.create(choice: choice_yellow1b, situation: situation_yellow2b, outcome: false)

SituationChoice.create(choice: choice_yellow2aa, situation: situation_yellow2a, outcome: true)
SituationChoice.create(choice: choice_yellow2ab, situation: situation_yellow2a, outcome: true)
SituationChoice.create(choice: choice_yellow2ba, situation: situation_yellow2b, outcome: true)
SituationChoice.create(choice: choice_yellow2bb, situation: situation_yellow2b, outcome: true)

SituationChoice.create(choice: choice_yellow2aa, situation: situation_yellow3aa, outcome: false)
SituationChoice.create(choice: choice_yellow2ab, situation: situation_yellow3ab, outcome: false)
SituationChoice.create(choice: choice_yellow2ba, situation: situation_yellow3ba, outcome: false)
SituationChoice.create(choice: choice_yellow2bb, situation: situation_yellow3bb, outcome: false)


# puts "seeding user_choices..."
# user_choice_new = UserChoice.create(user: 1, choice: choice0)
# user_choice1a = UserChoice.create(user: 1, choice: choice_red1a)


puts "seeding complete!"
