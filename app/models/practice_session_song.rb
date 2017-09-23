class PracticeSessionSong < ActiveRecord::Base
  before_validation :assign_song, :assign_instrument, on: :create

  belongs_to :practice_session
  belongs_to :song
  belongs_to :instrument

  validates :practice_session_id, :song_id, :instrument_id, presence: true

  private

  def assign_song
    self.song = self.practice_session.codex.songs.sample
    true
  end

  def assign_instrument
    self.instrument = self.practice_session.instruments.sample
    true
  end
end
