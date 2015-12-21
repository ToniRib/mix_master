FactoryGirl.define do
  factory :artist do
    name       'Anberlin'
    image_path 'http://anberlin.com/bandlg.jpg'
  end

  factory :song do
    title "Feel Good Drag"
    artist nil
  end
end
