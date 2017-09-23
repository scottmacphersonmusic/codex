require 'rails_helper'

describe PracticeSessionSongsController do
  let(:codex) { create :codex }
  let(:practice_session) { create :practice_session, codex: codex }

  before {
    create :instrument
    song = create :song
    create :codex_song, codex: codex, song: song
    create :practice_session_song, practice_session: practice_session
  }

  subject { post :create, practice_session_id: practice_session }

  describe 'POST create' do
    it 'creates a practice session song' do
      expect{ subject }.to change{ PracticeSessionSong.count }.by(1)
    end

    it 'redirects to @practice_session_song' do
      expect(subject)
        .to(
          redirect_to(
            practice_session_song_path(
              assigns(:practice_session),
              assigns(:practice_session_song)
            )
          )
        )
    end
  end
end
