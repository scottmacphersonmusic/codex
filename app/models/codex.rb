class Codex < ActiveRecord::Base
  validates :name, presence: true
end
