require 'rails_helper'

describe Product do
  before do
    #here you put your code to generate test content
    @product = Product.create!(name: "Mad bike", description: "Mountain bike", colour: "blue", price: "780", image_url: "bicycle7.jpg")
    @user = User.create!(email: "test@test.com", password: "123456")
    @product.comments.create!(rating: 1, user: @user, body: "hi what is this!")
    @product.comments.create!(rating: 3, user: @user, body: "seems good bike!")
    @product.comments.create!(rating: 5, user: @user, body: "look like the best!")

  end

  it "returns the average rating of all comments" do
    expect(@product.average_rating).to eq 3
  end

  it "is not valid" do
    expect(Product.new(description: "Nice bike")).not_to be_valid
  end
end

