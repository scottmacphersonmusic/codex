class PracticeSessionSong < ActiveRecord::Base
  belongs_to :practice_session
  belongs_to :song
  has_one :instrument
end
