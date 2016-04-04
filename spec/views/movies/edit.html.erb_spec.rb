require 'rails_helper'

RSpec.describe "movies/edit", type: :view do
  before(:each) do
    @movie = assign(:movie, Movie.create!(
      :title => "MyString",
      :description => "MyString",
      :year => 1,
      :director => "MyString"
    ))
  end

  it "renders the edit movie form" do
    render

    assert_select "form[action=?][method=?]", movie_path(@movie), "post" do

      assert_select "input#movie_title[name=?]", "movie[title]"

      assert_select "input#movie_description[name=?]", "movie[description]"

      assert_select "input#movie_year[name=?]", "movie[year]"

      assert_select "input#movie_director[name=?]", "movie[director]"
    end
  end
end
