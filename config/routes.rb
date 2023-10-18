Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :users do
    collection do
      get 'read_from_ad'
    end
  end

  resources :phonebooks do
    collection do
      get 'list'
      get 'fill_in'
    end

    namespace :dsp do
      resources :data_carriers
    end
  end
  root 'phonebooks#index'
end

