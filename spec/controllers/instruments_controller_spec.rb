require 'rails_helper'

describe InstrumentsController do
  describe 'POST create' do
    context 'when successful' do
      subject { post :create, instrument: attributes_for(:instrument) }

      it 'creates an instrument' do
        expect{ subject }.to change{ Instrument.count }.by(1)
      end

      it 'assigns flash[:notice]' do
        subject
        expect(flash[:notice]).to be_present
      end

      it 'redirects to @instrument' do
        expect(subject).to redirect_to assigns(:instrument)
      end
    end

    context 'when unsuccessful' do
      subject { post :create, instrument: { name: nil } }

      it 'does not create an instrument' do
        expect{ subject }.to_not change{ Instrument.count }
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
