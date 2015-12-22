FactoryGirl.define do
  factory :artist do
    name
    image_path 'http://anberlin.com/bandlg.jpg'

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

  sequence :title, %w(A B C).cycle do |n|
    "Title#{n}"
  end

  factory :song do
    title
    artist
  end
end
