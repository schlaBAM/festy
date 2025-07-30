class Artist < ApplicationRecord
  has_many :events, through: :event_artists
  has_many :event_artists, dependent: :destroy
  validates :name, presence: true
end
