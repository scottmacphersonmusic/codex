class PracticeSession < ActiveRecord::Base
  has_many :practice_session_songs
  has_many :songs, through: :practice_session_songs
  has_and_belongs_to_many :instruments
end
