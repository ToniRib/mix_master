require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "they can no longer see the aritst" do
    artist_name = 'Anberlin'
    artist_image_path = 'http://example-image.com'

    artist = Artist.create(name: artist_name, image_path: artist_image_path)

    visit artist_path(artist)
    click_on 'Delete'

    expect(page).to_not have_content artist.name
  end
end
