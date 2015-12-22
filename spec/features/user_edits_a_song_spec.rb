require 'rails_helper'

RSpec.feature "User edits an exisiting song" do
  scenario "they update the song's information" do
    artist = create(:artist_with_one_song)
    song = artist.songs.first

    new_title = 'Alexithymia'

    visit song_path(song)
    click_on 'Edit'
    fill_in 'song_title', with: new_title
    select artist.name, from: 'song_artist_id'
    click_on 'Update Song'

    expect(page).to have_content new_title
    expect(page).to have_link artist.name, href: artist_path(artist)
  end
end
