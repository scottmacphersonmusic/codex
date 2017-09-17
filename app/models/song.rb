class Song < ActiveRecord::Base
  validates :title, :key, presence: true
end
