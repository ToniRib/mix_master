require 'rails_helper'

RSpec.feature "User edits an existing playlist" do
  scenario "they see the updated attributes" do
    playlist = create(:playlist_with_songs)
    old_song = playlist.songs.first
    new_song = create(:song, title: "New Song")

    new_playlist_name = 'Updated Playlist'

    visit playlist_path(playlist)

    click_on 'Edit'
    fill_in 'playlist_name', with: new_playlist_name
    check("song-#{new_song.id}")
    uncheck("song-#{old_song.id}")
    click_on 'Update Playlist'

    expect(page).to have_content new_playlist_name
    expect(page).to have_content new_song.title
    expect(page).not_to have_content old_song.title
  end
end
