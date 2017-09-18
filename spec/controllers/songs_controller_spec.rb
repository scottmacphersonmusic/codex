require 'rails_helper'

describe SongsController do
  describe 'POST create' do
    context 'when successful' do
      let(:codex) { create :codex }

      subject { post :create, song: attributes_for(:song), codex_id: codex }

      it 'creates a song' do
        expect{ subject }.to change{ Song.count }.by(1)
      end

      it 'creates association to codex via codex_songs' do
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
  end
end
