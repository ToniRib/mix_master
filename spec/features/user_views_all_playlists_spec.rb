require 'rails_helper'

RSpec.feature "User views all playlists" do
  scenario "they see a list of all playlist names" do
    playlist_one, playlist_two = create_list(:playlist, 2)

    visit playlists_path

    expect(page).to have_content playlist_one.name
    expect(page).to have_link playlist_one.name, playlist_path(playlist_one)

    expect(page).to have_content playlist_two.name
    expect(page).to have_link playlist_two.name, playlist_path(playlist_two)
  end
end
