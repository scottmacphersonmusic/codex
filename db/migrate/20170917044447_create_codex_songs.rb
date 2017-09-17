class CreateCodexSongs < ActiveRecord::Migration
  def change
    create_table :codex_songs do |t|
      t.belongs_to :codex, index: true
      t.belongs_to :song, index: true
      t.timestamps null: false
    end
  end
end
