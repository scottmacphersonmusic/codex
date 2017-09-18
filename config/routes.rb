Rails.application.routes.draw do
  resources :codices do
    resources :songs
  end

  root 'codices#index'
end
