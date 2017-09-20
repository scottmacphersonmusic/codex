class CreatePracticeSessionsAndPracticeSessionSongs < ActiveRecord::Migration
  def change
    create_table :practice_sessions do |t|
      t.string :notes

      t.timestamps null: false
    end

    create_table :practice_session_songs do |t|
      t.belongs_to :practice_session, index: true
      t.belongs_to :practice_session_song, index: true
      t.belongs_to :instrument, index: true

      t.timestamps null: false
    end

    create_table :instruments_practice_sessions do |t|
      t.belongs_to :instrument, index: true
      t.belongs_to :practice_session, index: true

      t.timestamps null: false
    end
  end
end
