require 'rails_helper'

RSpec.feature "User views all songs for an artist" do
  scenario "they see a link to each individual song sorted alphabetically" do
    song_titles = ['Alexithymia', 'Feel Good Drag', 'Dance, Dance, Christa Paffgen']
    artist = create(:artist)

    song_titles.each do |title|
      artist.songs.create(title: title)
    end

    visit artist_path(artist)
    click_on 'View Songs'

    expect(page).to have_content artist.name

    artist.songs.each do |song|
      expect(page).to have_link song.title, href: song_path(song)
    end

    within 'ul li:nth-child(1)' do
      expect(page).to have_content 'Alexithymia'
    end

    within 'ul li:nth-child(2)' do
      expect(page).to have_content 'Dance, Dance, Christa Paffgen'
    end

    within 'ul li:nth-child(3)' do
      expect(page).to have_content 'Feel Good Drag'
    end
  end
end
