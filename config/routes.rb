Rails.application.routes.draw do
  resources :codices do
    resources :songs
    resources :practice_sessions, only: [:create, :update]
  end

  resources :practice_session, only: [] do
    resources :practice_session_songs, only: [:show, :create], as: :songs
  end

  resources :instruments

  root 'codices#index'
end
