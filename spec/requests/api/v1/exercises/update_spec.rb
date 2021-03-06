require 'rails_helper'

describe "Exercises API" do
  it "can update exercise" do
    current_user = create(:user)
    create_list(:exercise, 2)
    params = {exercise:
                {
                  name: "squats",
                  image: "default",
                  description: "sit in chair"
                }
              }
    put "/api/v1/exercises/1", params: params, headers: auth_headers(current_user)

    exercise = Exercise.find(1)
    expect(response.status).to eq 204
    expect(exercise["name"]).to eq "squats"
    expect(exercise["image"]).to eq "default"
    expect(exercise["description"]).to eq "sit in chair"
  end

  it "Unable to update non-existing exercise" do
    current_user = create(:user)
    create_list(:exercise, 2)
    params = {exercise:
                {
                  name: "squats",
                  description: "sit in chair"
                }
              }
    patch "/api/v1/exercises/100", params: params, headers: auth_headers(current_user)
    error = JSON.parse(response.body)

    expect(response.status).to eq 404
    expect(error["error"]).to eq "Error updating exercise with id: 100"
  end

  it "Cannot update existing exercise with invalid params" do
    current_user = create(:user)
    create_list(:exercise, 2)
    params = {exercise:
                {
                  blah: "squats",
                  blerg: "sit in chair"
                }
              }
    patch "/api/v1/exercises/1", params: params, headers: auth_headers(current_user)
    error = JSON.parse(response.body)

    expect(response.status).to eq 404
    expect(error["error"]).to eq "Error updating exercise with id: 1"
  end

  it "cannot access route without Authorization Header" do
    create_list(:exercise, 2)
    params = {exercise:
                {
                  name: "squats",
                  image: "default",
                  description: "sit in chair"
                }
              }
    put "/api/v1/exercises/1", params: params

    expect(response.status).to eq 401 
  end

end
