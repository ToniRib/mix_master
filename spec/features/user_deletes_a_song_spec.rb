require 'rails_helper'

RSpec.feature "User deletes a song" do
  context "user is on the artists song page" do
    scenario "the song is deleted and user returns to artist's page" do
      artist = create(:artist) do |artist|
        artist.songs.create(attributes_for(:song))
      end

      song = artist.songs.first

      visit artist_songs_path(artist)
      click_on 'Delete'

      expect(current_path).to eq artist_songs_path(artist)
      expect(page).not_to have_content song.title
    end
  end

  context "user is on the song index page" do
    scenario "the song is deleted and user returns to song index" do
      artist = create(:artist) do |artist|
        artist.songs.create(attributes_for(:song))
      end

      song = artist.songs.first

      visit songs_path
      click_on 'Delete'

      expect(current_path).to eq songs_path
      expect(page).not_to have_content song.title
    end
  end
end
