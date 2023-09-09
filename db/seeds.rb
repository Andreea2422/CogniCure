# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Create a main sample user.
User.create!(name: "Example User",
             email: "example@railstutorial.org",
             password: "foobar",
             password_confirmation: "foobar",
             doctor: true)

# # Generate a bunch of additional users.
10.times do |n|
  name = Faker::Name.name
  email = "example-#{n+11}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               doctor: true)
end

# Generate infos for a subset of users.
users = User.order(created_at: :desc).take(10)
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


SituationChoice.destroy_all
Situation.destroy_all
Choice.destroy_all

# Reset the ID sequence of the 'your_table_name' table to start from 1
ActiveRecord::Base.connection.execute("ALTER SEQUENCE choices_id_seq RESTART WITH 1")
ActiveRecord::Base.connection.execute("ALTER SEQUENCE situations_id_seq RESTART WITH 1")
ActiveRecord::Base.connection.execute("ALTER SEQUENCE situation_choices_id_seq RESTART WITH 1")

puts "seeding situations..."
# ID_MOOD RED-1 BLUE-2 YELLOW-3

situation_red0 = Situation.create(name: "situation_red0", story_text: "You will step into the shoes of Alex, a talented and driven professional working at a prestigious tech company.
Alex is known for their exceptional skills, but also for their short temper that often gets the best of them. As Alex, you'll face a series of situations that test your ability to manage your anger. The game kicks off with a confrontational encounter during an important meeting with your colleagues and superiors.
Your choices during this meeting set the tone for the rest of the game, affecting your relationships with colleagues, superiors, and even your own career trajectory.
As the story progresses, you'll encounter a variety of challenges that trigger your anger, such as dealing with demanding clients, managing unrealistic deadlines, and resolving conflicts with coworkers. Your choices will determine whether you can find healthier ways to cope with your anger or if you let it negatively impact your work and relationships.", id_mood: 1)
situation_red1 = Situation.create(name: "situation_red1", story_text: "Your colleague repeatedly interrupts you during an important meeting. What's your response?", id_mood: 1)
situation_red2a = Situation.create(name: "situation_red2a", story_text: "You manage to address the issue calmly, maintaining professionalism during the meeting. Congratulations! Your journey through the realm of anger reflects your commitment to growth and self-improvement.
By exploring anger management techniques, seeking self-awareness, and practicing patience, you've transformed fiery emotions into constructive outcomes. Remember that self-reflection and healthy communication are powerful tools in managing your reactions. As you move forward, embrace the power of empathy and understanding in your interactions.
Your journey is a testament to your dedication to positive change.", id_mood: 1)
situation_red2b = Situation.create(name: "situation_red2b", story_text: "Your angry outburst causes tension in the room, and the meeting becomes less productive. Sometime after the meeting ends, you: ", id_mood: 1)
situation_red3ba = Situation.create(name: "situation_red3ba", story_text: "Your willingness to apologize shows maturity and helps you grow as you work on handling anger better in the future. Congratulations! Your journey through the realm of anger reflects your commitment to growth and self-improvement.
By exploring anger management techniques, seeking self-awareness, and practicing patience, you've transformed fiery emotions into constructive outcomes. Remember that self-reflection and healthy communication are powerful tools in managing your reactions. As you move forward, embrace the power of empathy and understanding in your interactions.
Your journey is a testament to your dedication to positive change.", id_mood: 1)
situation_red3bb = Situation.create(name: "situation_red3bb", story_text: "You acknowledge the negative impact of your anger on the team dynamic and work to rebuild trust. Congratulations! Your journey through the realm of anger reflects your commitment to growth and self-improvement.
By exploring anger management techniques, seeking self-awareness, and practicing patience, you've transformed fiery emotions into constructive outcomes. Remember that self-reflection and healthy communication are powerful tools in managing your reactions. As you move forward, embrace the power of empathy and understanding in your interactions.
Your journey is a testament to your dedication to positive change", id_mood: 1)

situation_blue0 = Situation.create(name: "situation_blue0", story_text: "You will assume the role of Cassy, a young adult grappling with depression. The game begins with Cassy's struggle to get out of bed on a particularly difficult morning.
Throughout the story, Alex's interactions with friends, family, and acquaintances provide opportunities for connection, self-discovery, and potential sources of support.
The climax centers around a pivotal decision that could significantly impact Alex's path toward healing or further isolation. Depending on the choices made, the game leads to one of several endings that reflect Alex's emotional journey, highlighting the complexities of living with depression.", id_mood: 2)
situation_blue1 = Situation.create(name: "situation_blue1", story_text: "You wake up feeling tired and unmotivated. The day ahead feels overwhelming, and you're struggling to find motivation.", id_mood: 2)
situation_blue2a = Situation.create(name: "situation_blue2a", story_text: "You manage to get through the day, but your mood remains low. You consider reaching out to a friend.", id_mood: 2)
situation_blue2b = Situation.create(name: "situation_blue2b", story_text: "You stay in bed and listen to your favorite music, finding a bit of solace in the familiar tunes, though the underlying depression remains.
Congratulations! You've completed the Emotion Odyssey and navigated the challenges of depression. Your journey highlights the resilience and strength it takes to face each day when the weight of sadness lingers.
Remember, seeking support from friends, engaging in activities you once enjoyed, and understanding that you're not alone are important steps toward managing your emotions. As you move forward, keep exploring the things that bring even a flicker of joy to your life.", id_mood: 2)
situation_blue3aa = Situation.create(name: "situation_blue3aa", story_text: "Your friend agrees to meet. You spend time together, and it temporarily lifts your spirits. The next day, you: ", id_mood: 2)
situation_blue3ab = Situation.create(name: "situation_blue3ab", story_text: "You isolate yourself, feeling more isolated and down as a result.
Remember, seeking support from friends, engaging in activities you once enjoyed, and understanding that you're not alone are important steps toward managing your emotions. As you move forward, keep exploring the things that bring even a flicker of joy to your life.", id_mood: 2)
situation_blue4aaa = Situation.create(name: "situation_blue4aaa", story_text: "Engaging in the hobby brings a brief moment of joy. Finally, you: ", id_mood: 2)
situation_blue4aab = Situation.create(name: "situation_blue4aab", story_text: "As the day goes on, you feel more overwhelmed and guilty for not being productive. To keep these feelings at bay, you: ", id_mood: 2)
situation_blue5aaaa = Situation.create(name: "situation_blue5aaaa", story_text: "Feeling a bit better, you decide to text your friend and express gratitude for their company.
Remember, seeking support from friends, engaging in activities you once enjoyed, and understanding that you're not alone are important steps toward managing your emotions. As you move forward, keep exploring the things that bring even a flicker of joy to your life.", id_mood: 2)
situation_blue5aaab = Situation.create(name: "situation_blue5aaab", story_text: "Listening to music brings a brief sense of comfort, though the underlying depression remains.
Remember, seeking support from friends, engaging in activities you once enjoyed, and understanding that you're not alone are important steps toward managing your emotions. As you move forward, keep exploring the things that bring even a flicker of joy to your life.", id_mood: 2)
situation_blue5aaba = Situation.create(name: "situation_blue5aaba", story_text: "After a first meeting, you start to understand more of yourself and consider getting more help in the future.
Remember, seeking support from friends, engaging in activities you once enjoyed, and understanding that you're not alone are important steps toward managing your emotions. As you move forward, keep exploring the things that bring even a flicker of joy to your life.", id_mood: 2)
situation_blue5aabb = Situation.create(name: "situation_blue5aabb", story_text: "Writing in your journal helps release pent-up emotions, you practice self-compassion and consider reaching out to a friend in the future.
Remember, seeking support from friends, engaging in activities you once enjoyed, and understanding that you're not alone are important steps toward managing your emotions. As you move forward, keep exploring the things that bring even a flicker of joy to your life.", id_mood: 2)

situation_yellow0 = Situation.create(name: "situation_yellow0", story_text: "You will step into the shoes of Chris, a high school student dealing with the tumultuous world of academics, friendships, and personal expectations. As the player, you'll navigate Alex's journey through the ups and downs of managing anxiety while facing the challenges of school, relationships, and self-discovery.", id_mood: 3)
situation_yellow1 = Situation.create(name: "situation_yellow1", story_text: "You have a major exam coming up. How do you approach studying?", id_mood: 3)
situation_yellow2a = Situation.create(name: "situation_yellow2a", story_text: "Your organized approach helps you feel prepared for the test, and your hard work pays off with a good grade.
Congratulations! Your journey through the labyrinth of anxiety showcases your determination and growth. By confronting your worries, seeking support, and challenging negative beliefs, you've learned valuable strategies to navigate the uncertainties of life. Remember that every step you take to manage anxiety is a victory over fear.
As you move forward, continue to empower yourself by acknowledging your strengths and practicing self-compassion. Your journey is an inspiration to embrace life's challenges with resilience.", id_mood: 3)
situation_yellow2b = Situation.create(name: "situation_yellow2b", story_text: "Your anxiety increases as the exam approaches, leading to a late-night cram session and less-than-ideal performance. On D-day you: ", id_mood: 3)
situation_yellow3ba = Situation.create(name: "situation_yellow3ba", story_text: "Your anxiety peaks during the exam, causing blanking out and difficulty concentrating. After the test: ", id_mood: 3)
situation_yellow3bb = Situation.create(name: "situation_yellow3bb", story_text: "You still feel anxious during the exam, but you manage to finish it. After the test: ", id_mood: 3)
situation_yellow4baa = Situation.create(name: "situation_yellow4baa", story_text: "You eventually receive a good grade on the test. Despite overthinking, you acknowledge your achievements and celebrate your success.
Congratulations! Your journey through the labyrinth of anxiety showcases your determination and growth. By confronting your worries, seeking support, and challenging negative beliefs, you've learned valuable strategies to navigate the uncertainties of life. Remember that every step you take to manage anxiety is a victory over fear.
As you move forward, continue to empower yourself by acknowledging your strengths and practicing self-compassion. Your journey is an inspiration to embrace life's challenges with resilience.", id_mood: 3)
situation_yellow4bab = Situation.create(name: "situation_yellow4bab", story_text: "You eventually receive a good grade on the test. However, with this feat you think every other exam will turn out like this, which is not a healthy thinking process.
Congratulations! Your journey through the labyrinth of anxiety showcases your determination and growth. By confronting your worries, seeking support, and challenging negative beliefs, you've learned valuable strategies to navigate the uncertainties of life. Remember that every step you take to manage anxiety is a victory over fear.
As you move forward, continue to empower yourself by acknowledging your strengths and practicing self-compassion. Your journey is an inspiration to embrace life's challenges with resilience.", id_mood: 3)
situation_yellow4bba = Situation.create(name: "situation_yellow4bba", story_text: "You eventually receive a good grade on the test. Despite overthinking, you acknowledge your achievements and celebrate your success.
Congratulations! Your journey through the labyrinth of anxiety showcases your determination and growth. By confronting your worries, seeking support, and challenging negative beliefs, you've learned valuable strategies to navigate the uncertainties of life. Remember that every step you take to manage anxiety is a victory over fear.
As you move forward, continue to empower yourself by acknowledging your strengths and practicing self-compassion. Your journey is an inspiration to embrace life's challenges with resilience.", id_mood: 3)
situation_yellow4bbb = Situation.create(name: "situation_yellow4bbb", story_text: "With the support of your teacher or counselor, you learn coping techniques for managing test anxiety in the future. As you continue facing academic challenges, you apply your newfound coping strategies to overcome anxiety and improve your performance.
Congratulations! Your journey through the labyrinth of anxiety showcases your determination and growth. By confronting your worries, seeking support, and challenging negative beliefs, you've learned valuable strategies to navigate the uncertainties of life. Remember that every step you take to manage anxiety is a victory over fear.
As you move forward, continue to empower yourself by acknowledging your strengths and practicing self-compassion. Your journey is an inspiration to embrace life's challenges with resilience.", id_mood: 3)

puts "seeding choices"
choice_red0 = Choice.create(name: "choice_red0", choice_text: "Begin", id_mood: 1)
choice_blue0 = Choice.create(name: "choice_blue0", choice_text: "Begin", id_mood: 2)
choice_yellow0 = Choice.create(name: "choice_yellow0", choice_text: "Begin", id_mood: 3)

choice_red1a = Choice.create(name: "choice_red1a", choice_text: "Take a deep breath and address their interruptions calmly.", id_mood: 1)
choice_red1b = Choice.create(name: "choice_red1b", choice_text: "Feel your anger rising and snap at them, demanding they stop.", id_mood: 1)
choice_red2ba = Choice.create(name: "choice_red2ba", choice_text: "reflect on your reaction and decide to apologize to your colleague for your outburst.", id_mood: 1)
choice_red2bb = Choice.create(name: "choice_red2bb", choice_text: "manage the fallout", id_mood: 1)

choice_blue1a = Choice.create(name: "choice_blue1a", choice_text: "Force yourself out of bed and try to follow your usual routine.", id_mood: 2)
choice_blue1b = Choice.create(name: "choice_blue1b", choice_text: "Stay in bed and avoid facing the day", id_mood: 2)
choice_blue2aa = Choice.create(name: "choice_blue2aa", choice_text: "Text a friend to hang out.", id_mood: 2)
choice_blue2ab = Choice.create(name: "choice_blue2ab", choice_text: "Decide not to bother your friend with your problems.", id_mood: 2)
choice_blue3aaa = Choice.create(name: "choice_blue3aaa", choice_text: " decide to explore a hobby you used to enjoy.", id_mood: 2)
choice_blue3aab = Choice.create(name: "choice_blue3aab", choice_text: " decide to stay in bed, feeling unmotivated.", id_mood: 2)
choice_blue4aaaa = Choice.create(name: "choice_blue4aaaa", choice_text: " decide to reach out", id_mood: 2)
choice_blue4aaab = Choice.create(name: "choice_blue4aaab", choice_text: " reflect on music", id_mood: 2)
choice_blue4aaba = Choice.create(name: "choice_blue4aaba", choice_text: " decide to seek help from a professional", id_mood: 2)
choice_blue4aabb = Choice.create(name: "choice_blue4aabb", choice_text: " decide to release your emotions", id_mood: 2)

choice_yellow1a = Choice.create(name: "choice_yellow1a", choice_text: "Break down the material into manageable sections, create a study schedule, and seek help if needed.", id_mood: 3)
choice_yellow1b = Choice.create(name: "choice_yellow1b", choice_text: "Feel overwhelmed, procrastinate, and hope for the best.", id_mood: 3)
choice_yellow2ba = Choice.create(name: "choice_yellow2ba", choice_text: "still feel nervous, despite how much you studied.", id_mood: 3)
choice_yellow2bb = Choice.create(name: "choice_yellow2bb", choice_text: "remind yourself of your preparations, and try to stay calm.", id_mood: 3)
choice_yellow3baa = Choice.create(name: "choice_yellow3baa", choice_text: " you find yourself over-analyzing every question and second-guessing your answers.", id_mood: 2)
choice_yellow3bab = Choice.create(name: "choice_yellow3bab", choice_text: "  you decide you did all you could and say whatever should happen.", id_mood: 2)
choice_yellow3bba = Choice.create(name: "choice_yellow3bba", choice_text: " you find yourself over-analyzing every question and second-guessing your answers.", id_mood: 2)
choice_yellow3bbb = Choice.create(name: "choice_yellow3bbb", choice_text: "  you decide to reach out to a teacher or counselor for guidance on managing test anxiety.", id_mood: 2)

puts "seeding situation_choices..."
SituationChoice.create(choice: choice_red0, situation: situation_red0, outcome: true)
SituationChoice.create(choice: choice_blue0, situation: situation_blue0, outcome: true)
SituationChoice.create(choice: choice_yellow0, situation: situation_yellow0, outcome: true)
SituationChoice.create(choice: choice_red0, situation: situation_red1, outcome: false)
SituationChoice.create(choice: choice_blue0, situation: situation_blue1, outcome: false)
SituationChoice.create(choice: choice_yellow0, situation: situation_yellow1, outcome: false)

# RED
SituationChoice.create(choice: choice_red1a, situation: situation_red1, outcome: true)
SituationChoice.create(choice: choice_red1b, situation: situation_red1, outcome: true)
SituationChoice.create(choice: choice_red1a, situation: situation_red2a, outcome: false)
SituationChoice.create(choice: choice_red1b, situation: situation_red2b, outcome: false)

SituationChoice.create(choice: choice_red2ba, situation: situation_red2b, outcome: true)
SituationChoice.create(choice: choice_red2bb, situation: situation_red2b, outcome: true)
SituationChoice.create(choice: choice_red2ba, situation: situation_red3ba, outcome: false)
SituationChoice.create(choice: choice_red2bb, situation: situation_red3bb, outcome: false)

# BLUE
SituationChoice.create(choice: choice_blue1a, situation: situation_blue1, outcome: true)
SituationChoice.create(choice: choice_blue1b, situation: situation_blue1, outcome: true)
SituationChoice.create(choice: choice_blue1a, situation: situation_blue2a, outcome: false)
SituationChoice.create(choice: choice_blue1b, situation: situation_blue2b, outcome: false)

SituationChoice.create(choice: choice_blue2aa, situation: situation_blue2a, outcome: true)
SituationChoice.create(choice: choice_blue2ab, situation: situation_blue2a, outcome: true)
SituationChoice.create(choice: choice_blue2aa, situation: situation_blue3aa, outcome: false)
SituationChoice.create(choice: choice_blue2ab, situation: situation_blue3ab, outcome: false)

SituationChoice.create(choice: choice_blue3aaa, situation: situation_blue3aa, outcome: true)
SituationChoice.create(choice: choice_blue3aab, situation: situation_blue3aa, outcome: true)
SituationChoice.create(choice: choice_blue3aaa, situation: situation_blue4aaa, outcome: false)
SituationChoice.create(choice: choice_blue3aab, situation: situation_blue4aab, outcome: false)

SituationChoice.create(choice: choice_blue4aaaa, situation: situation_blue4aaa, outcome: true)
SituationChoice.create(choice: choice_blue4aaab, situation: situation_blue4aaa, outcome: true)
SituationChoice.create(choice: choice_blue4aaaa, situation: situation_blue5aaaa, outcome: false)
SituationChoice.create(choice: choice_blue4aaab, situation: situation_blue5aaab, outcome: false)
SituationChoice.create(choice: choice_blue4aaba, situation: situation_blue4aab, outcome: true)
SituationChoice.create(choice: choice_blue4aabb, situation: situation_blue4aab, outcome: true)
SituationChoice.create(choice: choice_blue4aaba, situation: situation_blue5aaba, outcome: false)
SituationChoice.create(choice: choice_blue4aabb, situation: situation_blue5aabb, outcome: false)


# YELLOW
SituationChoice.create(choice: choice_yellow1a, situation: situation_yellow1, outcome: true)
SituationChoice.create(choice: choice_yellow1b, situation: situation_yellow1, outcome: true)
SituationChoice.create(choice: choice_yellow1a, situation: situation_yellow2a, outcome: false)
SituationChoice.create(choice: choice_yellow1b, situation: situation_yellow2b, outcome: false)

SituationChoice.create(choice: choice_yellow2ba, situation: situation_yellow2b, outcome: true)
SituationChoice.create(choice: choice_yellow2bb, situation: situation_yellow2b, outcome: true)
SituationChoice.create(choice: choice_yellow2ba, situation: situation_yellow3ba, outcome: false)
SituationChoice.create(choice: choice_yellow2bb, situation: situation_yellow3bb, outcome: false)

SituationChoice.create(choice: choice_yellow3baa, situation: situation_yellow3ba, outcome: true)
SituationChoice.create(choice: choice_yellow3bab, situation: situation_yellow3ba, outcome: true)
SituationChoice.create(choice: choice_yellow3baa, situation: situation_yellow4baa, outcome: false)
SituationChoice.create(choice: choice_yellow3bab, situation: situation_yellow4bab, outcome: false)
SituationChoice.create(choice: choice_yellow3bba, situation: situation_yellow3bb, outcome: true)
SituationChoice.create(choice: choice_yellow3bbb, situation: situation_yellow3bb, outcome: true)
SituationChoice.create(choice: choice_yellow3bba, situation: situation_yellow4bba, outcome: false)
SituationChoice.create(choice: choice_yellow3bbb, situation: situation_yellow4bbb, outcome: false)


puts "seeding complete!"
