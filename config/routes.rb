Rails.application.routes.draw do
  resources :codices

  root 'codices#index'
end
