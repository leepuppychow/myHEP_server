require 'rails_helper'

describe "Exercises API" do
  it "Index endpoint will send an array of all exercises" do
    create_list(:exercise, 3)

    get '/api/v1/exercises'

    exercises = JSON.parse(response.body)

    expect(exercises.count).to eq(3)
    expect(exercises.first["name"]).to be_a(String)
    expect(exercises.first["image"]).to be_a(String)
    expect(exercises.first["description"]).to be_a(String)
    expect(exercises.first["created_at"]).to be_a(String)
    expect(exercises.first["updated_at"]).to be_a(String)
  end
end
