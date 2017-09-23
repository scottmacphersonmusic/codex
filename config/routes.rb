Rails.application.routes.draw do
  resources :codices do
    resources :songs
    resources :practice_sessions, only: [:create, :update]
  end

  resources :instruments, :practice_session_songs

  root 'codices#index'
end
