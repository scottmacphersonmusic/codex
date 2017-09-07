require 'rails_helper'

describe CodicesController do
  describe 'POST #create' do
    context 'when codices are saved' do
      subject { post :create, codex: attributes_for(:codex) }

      it 'creates codices' do
        expect{ subject }.to change{ Codex.count }.by(1)
      end

      it 'redirects to :show' do
        expect(subject).to redirect_to action: :show, id: assigns(:codex).id
      end

      it 'adds a flash :notice' do
        subject
        expect(flash[:notice]).to be_present
      end
    end

    context 'when codices are not saved' do
      subject{ post :create, codex: {name: nil} }

      it 'does not create codices' do
        expect{ subject }.to_not change{ Codex.count }
      end

      it 'renders :new' do
        expect(subject).to render_template(:new)
      end

      it 'adds a flash :error' do
        subject
        expect(flash[:error]).to be_present
      end
    end
  end
end
