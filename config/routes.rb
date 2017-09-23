Rails.application.routes.draw do
  resources :codices do
    resources :songs
    post '/practice_sessions/',
         to: 'practice_sessions#start',
         as: 'practice_session_start'
  end

  resources :instruments, :practice_session_songs

  root 'codices#index'
end
