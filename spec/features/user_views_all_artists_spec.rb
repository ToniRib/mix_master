require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they see a page with all artists" do
    3.times { create(:artist) }
    artists = Artist.all

    visit artists_path

    artists.each do |artist|
      expect(page).to have_link artist.name, href: artist_path(artist)
    end
  end
end
