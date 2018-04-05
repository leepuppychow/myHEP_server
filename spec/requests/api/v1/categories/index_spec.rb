require 'rails_helper'

describe "Category endpoints" do
  it "can get index of all categories" do
    create_list(:category, 3)

    get '/api/v1/categories'

    categories = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(categories.count).to eq 3
    expect(categories.first).to be_a Hash
    expect(categories.first["name"]).to be_a String
  end
end