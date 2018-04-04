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
WorkoutExercise.delete_all

sunday = Weekday.create(name: "Sunday")
monday = Weekday.create(name: "Monday")
tuesday = Weekday.create(name: "Tuesday")
wednesday = Weekday.create(name: "Wednesday")
thursday = Weekday.create(name: "Thursday")
friday = Weekday.create(name: "Friday")
saturday = Weekday.create(name: "Saturday")

ex1 = Exercise.create(name: "Squat", image: "test", description: "Pretend you are sitting in a chair")
ex2 = Exercise.create(name: "Lunge", image: "test", description: "Lunge forward")
ex3 = Exercise.create(name: "Plank", image: "test", description: "Hold, keeping body inline")
ex4 = Exercise.create(name: "Run", image: "test", description: "Level ground, 7:30 pace")

workout1 = Workout.create(name: "Easy Day", status: 0, therapist: "Lee")
workout1.weekdays << [monday, wednesday, friday]
workout2 = Workout.create(name: "Hard Day", status: 0, therapist: "Lee")
workout2.weekdays << [tuesday, thursday]
workout3 = Workout.create(name: "Medium Day", status: 0, therapist: "Lee")
workout3.weekdays << [saturday, sunday]

workout1.exercises << [ex1, ex2]
workout2.exercises << [ex2, ex3]
workout3.exercises << [ex3, ex4, ex1]

puts "Seeding complete"
