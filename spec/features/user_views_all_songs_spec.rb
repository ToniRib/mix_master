require 'rails_helper'

RSpec.feature "User views all songs" do
  scenario "they see all songs in the database" do
    3.times { create(:song) }
    songs = Song.all

    visit songs_path

    songs.each do |song|
      expect(page).to have_link song.title, href: song_path(song)
      expect(page).to have_content song.title
    end
  end

  context "multiple artists with songs have been created" do
    scenario "they see all songs regardless of artist" do
      artist_1 = create(:artist_with_songs, songs_count: 2)
      artist_2 = create(:artist_with_one_song)

      all_songs = artist_1.songs + artist_2.songs

      visit songs_path

      all_songs.each do |song|
        expect(page).to have_link song.title, href: song_path(song)
        expect(page).to have_content song.title
      end
    end
  end
end
