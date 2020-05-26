class Record < ApplicationRecord
  belongs_to :users, optional: true

  validates :title, :year, :artist, presence: true
end
