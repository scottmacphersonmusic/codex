require 'rails_helper'

describe CodicesController do
  describe 'POST create' do
    context 'when codices are saved' do
      subject { post :create, codex: attributes_for(:codex) }

      it 'creates a codex' do
        expect{ subject }.to change{ Codex.count }.by(1)
      end

      it 'assigns flash[:notice]' do
        subject
        expect(flash[:notice]).to be_present
      end

      it 'redirects to :show' do
        expect(subject).to redirect_to assigns(:codex)
      end
    end

    context 'when codices are not saved' do
      subject { post :create, codex: { name: nil } }

      it 'does not create codices' do
        expect{ subject }.to_not change{ Codex.count }
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
    let(:codex) { create :codex }

    context 'when codices are saved' do
      subject { put :update, id: codex, codex: { name: "#{codex.name}_2" } }

      it 'updates a codex' do
        expect{ subject }.to change{ codex.reload.name }
      end

      it 'assigns flash[:notice]' do
        subject

        expect(flash[:notice]).to be_present
      end

      it 're-directs to :show' do
        expect(subject).to redirect_to codex
      end
    end
  end
end
