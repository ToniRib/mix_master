require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they update the artist's information" do
    artist_original_name = 'Anberlin'
    artist_image_path = 'http://example-image.com'
    artist_new_name = 'Incubus'

    artist = Artist.create(name: artist_original_name, image_path: artist_image_path)

    visit artist_path(artist)

    click_on 'Edit'
    fill_in 'artist_name', with: artist_new_name
    click_on 'Update Artist'

    expect(page).to have_content artist_new_name
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
