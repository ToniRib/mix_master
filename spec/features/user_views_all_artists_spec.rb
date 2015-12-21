require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they see a page with all artists" do
    artists = ['Anberlin', 'Incubus', 'Young the Giant']

    artists.map! do |name|
      Artist.create(name: name, image_path: 'http://example.jpg')
    end

    visit artists_path

    artists.each do |artist|
      expect(page).to have_link artist.name, href: artist_path(artist)
    end
  end
end
