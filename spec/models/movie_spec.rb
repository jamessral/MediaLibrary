require 'rails_helper'

RSpec.describe Movie, type: :model do

  it "requires a movie title" do
   movie_with = Movie.new(title: "Test")
   expect(movie_with).to be_valid

   movie_without = Movie.new(title: '') 
   expect(movie_without).to be_invalid
  end
end
