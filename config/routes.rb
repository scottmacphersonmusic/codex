Rails.application.routes.draw do
  resources :codices do
    resources :songs
    post '/practice_sessions/',
         to: 'practice_sessions#start',
         as: 'practice_session_start'
    put '/practice_sessions/:id',
         to: 'practice_sessions#stop',
         as: 'practice_session_stop'
  end

  resources :instruments, :practice_session_songs

  root 'codices#index'
end
