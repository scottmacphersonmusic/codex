require 'rails_helper'

describe CodicesController do
  context 'POST #create' do
    it 'creates codices' do
      codex_params = attributes_for :codex
      expect { post :create, article: codex_params }
        .to change(Codex, :count).by(1)
    end
  end
end
