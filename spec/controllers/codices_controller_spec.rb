require 'rails_helper'

describe CodicesController do
  describe 'POST create' do
    context 'when successful' do
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

    context 'when unsuccessful' do
      subject { post :create, codex: { name: nil } }

      it 'does not create a codex' do
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

    context 'when successful' do
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

    context 'when unsuccessful' do
      subject { put :update, id: codex, codex: { name: nil} }

      it 'does not update a codex' do
        expect{ subject }.to_not change{ codex.reload.name }
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
    let(:codex) { create :codex }

    subject { delete :destroy, id: codex }

    it 'deletes a codex' do
      codex.reload
      expect(Codex.count).to eq 1
      expect{ subject }.to change{ Codex.count }.by(-1)
    end

    it 'assigns flash[:notice]' do
      subject

      expect(flash[:notice]).to be_present
    end

    it 'redirects to :index' do
      expect(subject).to redirect_to :codices
    end
  end
end
