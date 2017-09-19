class Instrument < ActiveRecord::Base
  validates :name, :key, presence: true
end
