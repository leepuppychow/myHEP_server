# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Exercise.delete_all
Workout.delete_all

Exercise.create(name: "Squat", image: "test", description: "Pretend you are sitting in a chair")
Exercise.create(name: "Lunge", image: "test", description: "Lunge forward")
Exercise.create(name: "Plank", image: "test", description: "Hold, keeping body inline")

Workout.create(name: "Easy Day", weekday: "Monday", status: 0, therapist: "Lee")
Workout.create(name: "Hard Day", weekday: "Tuesday", status: 0, therapist: "Lee")
Workout.create(name: "Medium Day", weekday: "Friday", status: 0, therapist: "Lee")

puts "Seeding complete"
