require 'rails_helper'

describe "Exercises API" do
  it "Delete exercise" do
    create_list(:exercise, 2)

    delete '/api/v1/exercises/1'

    expect(response.status).to eq(204)
    expect(response.body).to eq("")

    exercise = Exercise.find_by(id: 1)
    expect(exercise).to be_nil
  end
end
