require 'rails_helper'

describe SongsController do
  let(:codex) { create :codex }

  describe 'POST create' do
    context 'when successful' do
      subject { post :create, song: attributes_for(:song), codex_id: codex }

      it 'creates a song' do
        expect{ subject }.to change{ Song.count }.by(1)
      end

      it 'creates association to codex via codex_song' do
        expect{ subject }.to change{ CodexSong.count }.by(1)
        expect(assigns[:codex].songs.count).to eq 1
      end

      it 'assigns flash[:notice]' do
        subject
        expect(flash[:notice]).to be_present
      end

      it 'redirects to @codex' do
        expect(subject).to redirect_to assigns[:codex]
      end
    end

    context 'when unsuccessful' do
      subject { post :create, song: { title: nil }, codex_id: codex }

      it 'does not create a song' do
        expect{ subject }.to_not change{ Song.count }
      end

      it 'does not create a codex_song' do
        expect{ subject }.to_not change{ CodexSong.count }
      end

      it 'assigns flash[:error]' do
        subject
        expect(flash[:error]).to be_present
      end

      it 'renders :new' do
        expect(subject).to render_template :new
      end
    end
  end

  describe 'PUT update' do
    let(:song) { create :song }
    before { create :codex_song, codex: codex, song: song }

    context 'when successful' do
      subject {
        put :update,
            codex_id: codex,
            id: song,
            song: { title: 'new_title' }
      }

      it 'updates a song' do
        subject
        expect(song.reload.title).to eq 'new_title'
      end

      it 'assigns flash[:notice]' do
        subject
        expect(flash[:notice]).to be_present
      end

      it 'redirects to @codex' do
        expect(subject).to redirect_to assigns[:codex]
      end
    end

    context 'when unsuccessful' do
      subject {
        put :update,
            codex_id: codex,
            id: song,
            song: { title: nil }
      }

      it 'does not update a song' do
        expect{ subject }.to_not change{ song.reload.title }
      end

      it 'assigns flash[:error]' do
        subject
        expect(flash[:error]).to be_present
      end

      it 'renders :edit' do
        expect(subject).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    let(:song) { create :song }
    before { create :codex_song, codex: codex, song: song }

    subject { delete :destroy, id: song, codex_id: codex }

    it 'deletes a song' do
      expect{ subject }.to change{ Song.count }.by(-1)
    end

    it 'deletes the corresponding codex_song' do
      expect(CodexSong.count).to eq 1
      expect{ subject }.to change{ CodexSong.count }.by(-1)
    end

    it 'does not delete any associated codices' do
      expect{ subject }.to_not change{ Codex.count }
    end

    it 'assigns flash[:notice]' do
      subject
      expect(flash[:notice]).to be_present
    end

    it 'redirects to @codex' do
      expect(subject).to redirect_to assigns[:codex]
    end
  end
end
