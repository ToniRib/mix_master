FactoryGirl.define do
  factory :artist do
    name
    image_path 'http://anberlin.com/bandlg.jpg'

    factory :artist_with_one_song do
      after(:create) { |artist| create(:song, artist: artist) }
    end

    factory :artist_with_songs do
      transient do
        songs_count 4
      end

      after(:create) do |artist, evaluator|
        create_list(:song, evaluator.songs_count, artist: artist)
      end
    end
  end

  sequence :name do |n|
    "Anberlin#{n}"
  end

  sequence :title, %w(A B C D).cycle do |n|
    "Title#{n}"
  end

  factory :song do
    title
    artist
  end

  factory :playlist do
    name { generate(:playlist_name) }
  end

  sequence :playlist_name do |n|
    "Playlist #{n}"
  end
end
