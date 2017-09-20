class Song < ActiveRecord::Base
  has_many :codex_songs, dependent: :destroy
  has_many :codices, through: :codex_songs

  has_many :practice_session_songs
  has_many :practice_sessions, through: :practice_session_songs

  validates :title, :key, presence: true
end
