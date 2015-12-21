class Song < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :artist

  scope :sorted_by_title, -> { order(title: :asc) }
end
