class AddCodexIdToPracticeSessions < ActiveRecord::Migration
  def change
    add_reference :practice_sessions, :codex, index: true
    add_foreign_key :practice_sessions, :codices
  end
end
