require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they update the artist's information" do
    artist = create(:artist)

    artist_new_name = 'Incubus'

    visit artist_path(artist)
    click_on 'Edit'
    fill_in 'artist_name', with: artist_new_name
    click_on 'Update Artist'

    expect(page).to have_content artist_new_name
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
  end
end
