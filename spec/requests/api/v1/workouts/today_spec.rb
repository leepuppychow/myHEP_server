require 'rails_helper'

describe "Workout Endpoints" do
  it "can get today's workout" do
    current_user = create(:user)
    workout1 = create(:workout)
    workout2 = create(:workout)
    monday = create(:weekday, name: "monday")
    tuesday = create(:weekday, name: "tuesday")
    wednesday = create(:weekday, name: "wednesday")
    thursday = create(:weekday, name: "thursday")
    friday = create(:weekday, name: "friday")
    saturday = create(:weekday, name: "saturday")
    sunday = create(:weekday, name: "sunday")
    workout1.weekdays << [monday, wednesday, friday]
    workout2.weekdays << [sunday, tuesday, thursday, saturday]
    current_user.workouts << [workout1, workout2]

    get '/api/v1/workouts/today', headers: auth_headers(current_user)
    workouts = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(workouts.count).to eq 1
  end
end
