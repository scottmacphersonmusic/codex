class AddDoneToPracticeSessions < ActiveRecord::Migration
  def change
    add_column :practice_sessions, :done, :boolean, default: false
  end
end
