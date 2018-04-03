require 'rails_helper'

describe "Exercises API" do
  it "Delete exercise" do
    create_list(:exercise, 2)

    delete '/api/v1/exercises/1'

    expect(response.status).to eq 204
    expect(response.body).to eq("")

    exercise = Exercise.find_by(id: 1)
    expect(exercise).to eq nil
  end

  it "Cannot delete non-existing exercise" do
    create_list(:exercise, 2)

    delete '/api/v1/exercises/100'

    error = JSON.parse(response.body)

    expect(response.status).to eq 404
    expect(error["error"]).to eq "Unable to delete exercise with id: 100"
  end
end
