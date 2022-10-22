Rails.application.routes.draw do
  resources :phonebooks

  root 'phonebooks#index'
end
