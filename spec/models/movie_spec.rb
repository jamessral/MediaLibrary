require 'rails_helper'

RSpec.describe Movie, type: :model do

  it "requires a movie title" do
   movie_with = Movie.new(title: "Test")
   expect(movie_with).to be_valid

   movie_without = Movie.new(title: '')
   expect(movie_without).to be_invalid
  end

  it "is available to only its user" do
    user1 = User.new(email: "test@test.com", id: 1)
    user2 = User.new(email: "test@test.com", id: 2)
    movie1 = Movie.create!(title: "Test", user_id: 1)
    movie2 = Movie.create!(title: "Test2", user_id: 2)

    expect(user1.movies).to contain_exactly(movie1)
    expect(user2.movies).to contain_exactly(movie2)
  end
end
