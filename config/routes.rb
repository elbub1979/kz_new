Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :phonebooks do
    get 'fill_in', on: :collection
    collection do
      get 'list'
    end
  end

  namespace :dsp do
    resources :data_carriers
  end

  root 'phonebooks#index'
end
