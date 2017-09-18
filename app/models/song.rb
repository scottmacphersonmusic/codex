class Song < ActiveRecord::Base
  has_many :codex_songs, dependent: :destroy
  has_many :codices, through: :codex_songs

  validates :title, :key, presence: true
end
