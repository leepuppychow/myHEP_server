# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Exercise.delete_all
Workout.delete_all
Weekday.delete_all

sunday = Weekday.create(name: "Sunday")
monday = Weekday.create(name: "Monday")
tuesday = Weekday.create(name: "Tuesday")
wednesday = Weekday.create(name: "Wednesday")
thursday = Weekday.create(name: "Thursday")
friday = Weekday.create(name: "Friday")
saturday = Weekday.create(name: "Saturday")

Exercise.create(name: "Squat", image: "test", description: "Pretend you are sitting in a chair")
Exercise.create(name: "Lunge", image: "test", description: "Lunge forward")
Exercise.create(name: "Plank", image: "test", description: "Hold, keeping body inline")

workout1 = Workout.create(name: "Easy Day", status: 0, therapist: "Lee")
workout1.weekdays << [monday, wednesday, friday]
workout2 = Workout.create(name: "Hard Day", status: 0, therapist: "Lee")
workout2.weekdays << [tuesday, thursday]
workout3 = Workout.create(name: "Medium Day", status: 0, therapist: "Lee")
workout3.weekdays << [saturday, sunday]

puts "Seeding complete"
