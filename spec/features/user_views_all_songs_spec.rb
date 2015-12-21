require 'rails_helper'

RSpec.feature "User views all songs" do
  scenario "they see a link to each individual song sorted alphabetically" do
    song_titles = ['Alexithymia', 'Feel Good Drag', 'Dance, Dance, Christa Paffgen']
    songs = song_titles.map do |title|
      Song.create(title: title)
    end

    visit songs_path

    songs.each do |song|
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
