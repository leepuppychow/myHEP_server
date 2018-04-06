# README

This RESTful API is a server for the MyHEP React Native application that I am building. It serves up several endpoints for a patient's workouts, exercises, workout-exercises, and categories of exercise.

![alt text](myHEP_schema.png)

## Endpoints

* Base URL: http://my-hep.herokuapp.com/api/v1

* Data for POST and PUT/PATCH requests are passed in through parameters

## Getting Authentication Token

* This API uses the knock gem to generate JSON Web Tokens. In order to access endpoints, first get a token using the following user info:

```
  POST '/user_token' with:
  headers: {"Content-Type": "application/json"}
  body: {"auth": {"email": "lee@gmail.com", "password": "password"}}
```

### Categories

```
  GET '/categories' --> Index of all categories

  GET '/categories/:id' --> Shows one category
```

### Exercises

```
  GET '/exercises' --> Index of all exercises

  GET '/exercises/:id' --> Shows one exercise

  POST '/exercises' --> Create new exercise

  PUT/PATCH '/exercises/:id' --> Update exercise

  DELETE '/exercises/:id' --> Delete exercise
```

### Workouts

```
  GET '/workouts' --> Index of all workouts

  GET '/workouts/:id' --> Shows one workout

  POST '/workouts' --> Create new workout

  PUT/PATCH '/workouts/:id' --> Update workout

  DELETE '/workouts/:id' --> Delete workout
```

### Workout_exercises
* (NOTE: there is no index route here, as the workout show endpoint will have all corresponding workout_exercises)

```
  GET '/workouts/:workout_id/exercises/:exercise_id' --> Shows one workout_exercise

  POST '/workouts/:workout_id/exercises/' --> Create new workout_exercise

  PUT/PATCH '/workouts/:workout_id/exercises/:exercise_id' --> Update workout_exercise

  DELETE '/workouts/:workout_id/exercises/:exercise_id' --> Delete workout_exercise
```

## Setup

* Ruby version
  - Ruby: 2.5.0
  - Rails: 5.1.6

* Configuration and Database Creation
  - git clone repository
  - rake db:create
  - rake db:migrate
  - rake db:seed

* How to run the test suite
  - rspec
  - open coverage/index.html --> for SimpleCov test coverage information
