require 'rails_helper'

feature "user attemps to add movie" do
  scenario "and is successful" do
    visit new_movie_path
    fill_in 'Title', with: 'The Life Aquatic'
    fill_in 'Director', with: 'Wes Anderson'
    fill_in 'Year', with: '2004'
    fill_in 'Format', with: 'DVD'
    click_on 'Add Movie'
  end
end
