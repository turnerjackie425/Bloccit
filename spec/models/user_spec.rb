require 'rails_helper'

describe User do
  
  include TestFactories

  before do
    @post = associated_post
    @favorite = Favorite.new
  end 

  describe "#favorited(post)" do
    it "returns 'nil' if the user has not favorited the post" do
       expect(favorite).to be_nil
    end

    it "returns the appropriate favorite if it exists" do
      if favorite.create?
        expect(favorite).to be_true
      else
        expect(favorite).to be_nil
      end
    end
  end
end