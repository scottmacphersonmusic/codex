Rails.application.routes.draw do
  resources :codices do
    resources :songs
  end

  resources :instruments

  root 'codices#index'
end
