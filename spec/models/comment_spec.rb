require "rails_helper"

describe Comment do

  it "is not valid" do 
    expect(Comment.new(body: "This book is not good")).not_to be_valid
  end
end