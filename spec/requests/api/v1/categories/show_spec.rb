require 'rails_helper'

describe "Category endpoints" do
  it "can show individual category with its exercises" do
    category = create(:category)
    ex1, ex2, ex3 = create_list(:exercise, 3)
    category.exercises << [ex1, ex2, ex3]

    get "/api/v1/categories/#{category.id}"

    category = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(category).to be_a Hash
    expect(category["name"]).to be_a String
    expect(category["exercises"]).to be_a Array
    expect(category["exercises"].first).to be_a Hash
    expect(category["exercises"].first["name"]).to be_a String
    expect(category["exercises"].first["image"]).to be_a String
    expect(category["exercises"].first["description"]).to be_a String
  end

  it "cannot find category with incorrect ID" do
    get "/api/v1/categories/blerg"

    error = JSON.parse(response.body)

    expect(response.status).to eq 404
    expect(error["error"]).to eq "Unable to find category with id: blerg"   
  end
end
