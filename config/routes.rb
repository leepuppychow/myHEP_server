Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :exercises, except: [:new, :edit]
      resources :workouts, except: [:new, :edit]
      resources :workout_exercises, except: [:new, :edit, :index]
    end
  end
end
