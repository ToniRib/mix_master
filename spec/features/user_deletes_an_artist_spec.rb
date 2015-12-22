require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "they can no longer see the aritst" do
    artist = create(:artist)

    visit artist_path(artist)
    click_on 'Delete'

    expect(page).to_not have_content artist.name
  end
end
