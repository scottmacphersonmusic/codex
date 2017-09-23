class Codex < ActiveRecord::Base
  has_many :codex_songs, dependent: :destroy
  has_many :songs, through: :codex_songs
  has_many :practice_sessions

  validates :name, presence: true
end
