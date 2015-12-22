require 'rails_helper'

RSpec.feature "User views all songs for an artist" do
  scenario "they see all associated songs" do
    artist = create(:artist_with_songs)

    visit artist_path(artist)
    click_on 'View Songs'

    artist.songs.each do |song|
      expect(page).to have_content song.title
      expect(page).to have_link song.title, href: song_path(song)
    end
  end

  scenario "they do not see songs from a different artist" do
    artist_1 = create(:artist_with_songs, songs_count: 2)
    artist_2 = create(:artist_with_one_song)

    visit artist_path(artist_1)
    click_on 'View Songs'

    expect(page).not_to have_content artist_2.songs.first.title
  end
end
