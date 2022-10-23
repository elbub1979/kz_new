Rails.application.routes.draw do
  resources :phonebooks do
    get 'fill_in', on: :collection
  end

  root 'phonebooks#index'
end
