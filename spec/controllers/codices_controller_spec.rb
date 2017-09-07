require 'rails_helper'

describe CodicesController do
  context 'POST #create' do
    subject { post :create, codex: attributes_for(:codex) }

    it 'creates codices' do
      expect{ subject }.to change{ Codex.count }.by(1)
    end

    it 'redirects to :show' do
      expect(subject).to redirect_to action: :show, id: assigns(:codex).id
    end

    it 'populates a flash notice' do
      subject
      expect(flash[:notice]).to be_present
    end
  end
end
