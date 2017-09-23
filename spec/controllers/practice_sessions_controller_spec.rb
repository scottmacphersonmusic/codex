require 'rails_helper'

describe PracticeSessionsController do
  let(:codex) { create :codex }

  describe 'POST create' do
    subject {
      post :create,
           codex_id: codex,
           practice_session: attributes_for(:practice_session)
    }

    context 'when successful' do
      before {
        create :instrument
        create :codex_song, codex: codex, song: create(:song)
      }

      it 'creates a practice session' do
        expect{ subject }.to change{ PracticeSession.count }.by(1)
      end

      it 'creates a practice session song' do
        song = create :song
        create :codex_song, codex: codex, song: song

        expect{ subject }.to change{ PracticeSessionSong.count }.by(1)
        expect(PracticeSessionSong.first.instrument).to be_present
      end

      it 'assigns flash[:notice]' do
        expect{ subject }.to change{ flash[:notice].present? }
      end

      it 'redirects to @practice_session_song' do
        expect(subject).to redirect_to assigns(:practice_session_song)
      end
    end

    context 'when unsuccessful' do # no songs/instruments
      it 'does not create a practice session' do
        expect{ subject }.to_not change{ PracticeSession.count }
      end

      it 'does not create a practice session song' do
        expect{ subject }.to_not change{ PracticeSessionSong.count }
      end

      it 'assigns flash[:error]' do
        expect{ subject }.to change{ flash[:error].present? }
      end

      it 'redirects to @codex' do
        expect(subject).to redirect_to assigns(:codex)
      end
    end
  end

  describe 'PUT update' do # mark as done; don't destroy
    let(:practice_session) { create :practice_session, codex: codex }

    subject {
      put :update,
          codex_id: codex,
          id: practice_session
    }

    before {
      create :instrument
      create :codex_song, codex: codex, song: create(:song)
    }

    it 'sets practice_session.done to true' do
      subject
      expect(PracticeSession.first.done?).to eq true
    end

    it 'assigns flash[:notice]' do
      expect{ subject }.to change{ flash[:notice] }
    end

    it 'redirects to @codex' do
      expect(subject).to redirect_to codex_path(assigns(:codex))
    end
  end
end
