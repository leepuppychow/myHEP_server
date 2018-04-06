# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ExerciseCategory.destroy_all
Category.destroy_all
Weekday.destroy_all
WorkoutExercise.destroy_all
Exercise.destroy_all
Workout.destroy_all
User.destroy_all

ActiveRecord::Base.connection.tables.each do |table|
  ActiveRecord::Base.connection.reset_pk_sequence!(table)
end

lee = User.new(email: "lee@gmail.com",
                password: "password",
                password_confirmation: "password",
                first_name: "lee",
                last_name: "chow",
                username: "lee"
                )
lee.save

strength = Category.create(name: "Strength")
mobility = Category.create(name: "Mobility")
aerobic = Category.create(name: "Aerobic Training")
balance = Category.create(name: "Balance Training")
neuro_re_ed = Category.create(name: "Neuromuscular Re-education")
vestibular = Category.create(name: "Vestibular Training")
other = Category.create(name: "Other")

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

ex1.categories << strength
ex2.categories << strength
ex3.categories << strength
ex4.categories << aerobic

workout1 = Workout.create(name: "Easy Day", status: 0, therapist: "Lee")
workout1.weekdays << [monday, wednesday, friday]
workout2 = Workout.create(name: "Hard Day", status: 0, therapist: "Lee")
workout2.weekdays << [tuesday, thursday]
workout3 = Workout.create(name: "Medium Day", status: 0, therapist: "Lee")
workout3.weekdays << [saturday, sunday]

lee.workouts << [workout1, workout2, workout3]

we1 = WorkoutExercise.create(sets: 3, reps: 10, status: 0, workout: workout1, exercise: ex1)
we2 = WorkoutExercise.create(sets: 2, reps: 8, status: 0, workout: workout1, exercise: ex2)
we3 = WorkoutExercise.create(sets: 3, reps: 12, status: 0, workout: workout2, exercise: ex2)
we4 = WorkoutExercise.create(sets: 2, reps: 8, status: 0, workout: workout2, exercise: ex3)
we5 = WorkoutExercise.create(sets: 2, reps: 8, status: 0, workout: workout3, exercise: ex3)
we6 = WorkoutExercise.create(sets: 2, reps: 8, status: 0, workout: workout3, exercise: ex4)

puts "Seeding complete"
