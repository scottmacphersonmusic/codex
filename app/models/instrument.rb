class Instrument < ActiveRecord::Base
  has_and_belongs_to_many :practice_sessions

  validates :name, :key, presence: true
end
