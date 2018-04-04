Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :exercises, except: [:new, :edit]
      resources :workouts, except: [:new, :edit]
      scope as: :workout_exercise do
        get "/workouts/:workout_id/exercises/:exercise_id", to: "workout_exercises#show"
        post "/workouts/:workout_id/exercises", to: "workout_exercises#create"
        put "/workouts/:workout_id/exercises/:exercise_id", to: "workout_exercises#update"
        patch "/workouts/:workout_id/exercises/:exercise_id", to: "workout_exercises#update"
        delete "/workouts/:workout_id/exercises/:exercise_id", to: "workout_exercises#destroy"
      end
    end
  end
end
