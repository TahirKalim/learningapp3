require 'rails_helper'


describe Product do
  before do
    #here you put your code to generate test content
    @product = Product.create!(name: "cook book", description: "Super ways to cook.", price: "88", image_url: "https://image.ibb.co/g1dOfv/scientificoutlook.jpg")
    @user = User.create!(email: "hunger@test.com", password: "abcdefgh")
    @product.comments.create!(rating: 1, user: @user, body: "hunger!")
    @product.comments.create!(rating: 3, user: @user, body: "hunger hunger!")
    @product.comments.create!(rating: 5, user: @user, body: "hunger hunger hunger!")
  end

  it "returns the average rating of all comments" do
    expect(@product.average_rating).to eq 3
  end

  it "is not valid" do
    expect(Product.new(description: "cook book")).not_to be_valid
  end
end