class Codex < ActiveRecord::Base
  has_many :codex_songs, dependent: :destroy
  has_many :songs, through: :codex_songs

  validates :name, presence: true
end
