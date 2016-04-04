require 'rails_helper'

RSpec.describe "movies/index", type: :view do
  before(:each) do
    assign(:movies, [
      Movie.create!(
        :title => "Title",
        :description => "Description",
        :year => 1,
        :director => "Director"
      ),
      Movie.create!(
        :title => "Title",
        :description => "Description",
        :year => 1,
        :director => "Director"
      )
    ])
  end

  it "renders a list of movies" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Director".to_s, :count => 2
  end
end
