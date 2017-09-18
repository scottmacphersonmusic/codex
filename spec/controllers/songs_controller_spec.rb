require 'rails_helper'

describe SongsController do
  describe 'POST create' do
    let(:codex) { create :codex }

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

      it 'redirects to :show' do
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
end
