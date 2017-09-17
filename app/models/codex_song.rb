class CodexSong < ActiveRecord::Base
  belongs_to :codex
  belongs_to :song
end
