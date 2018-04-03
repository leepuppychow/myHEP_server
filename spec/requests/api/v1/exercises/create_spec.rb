require 'rails_helper'

describe "Exercises API" do
  it "can create new exercise" do
    params = {exercise:
                {
                  name: "squats",
                  image: "default",
                  description: "sit in chair"
                }
              }
    post "/api/v1/exercises", params: params

    exercise = JSON.parse(response.body)

    expect(response.status).to eq 201
    expect(exercise["name"]).to eq "squats"
    expect(exercise["image"]).to eq "default"
    expect(exercise["description"]).to eq "sit in chair"
    expect(exercise["created_at"]).to be_a(String)
    expect(exercise["updated_at"]).to be_a(String)
  end

  it "Unable to create with missing attributes" do
    params = {exercise:
                {
                  name: "squats",
                  description: "sit in chair"
                }
              }
    post "/api/v1/exercises", params: params

    error = JSON.parse(response.body)

    expect(response.status).to eq 400
    expect(error["error"]).to eq "Unable to create exercise"
  end
end
