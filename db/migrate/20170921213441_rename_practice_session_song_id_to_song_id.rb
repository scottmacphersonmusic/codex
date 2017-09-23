class RenamePracticeSessionSongIdToSongId < ActiveRecord::Migration
  def change
    rename_column :practice_session_songs,
                  :practice_session_song_id,
                  :song_id
  end
end
