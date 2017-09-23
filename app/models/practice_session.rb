class PracticeSession < ActiveRecord::Base
  before_validation :assign_instruments, :check_song_presence, on: :create

  has_many :practice_session_songs
  has_many :songs, through: :practice_session_songs
  has_and_belongs_to_many :instruments
  belongs_to :codex

  private

  def assign_instruments
    self.instruments = Instrument.all
    instruments.any?
  end

  def check_song_presence
    codex.songs.any?
  end
end
