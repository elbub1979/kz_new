Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    get 'read_from_ad', to: 'users/registrations#read_from_ad' #, as: 'read_from_ad'
  end

  resources :phonebooks do
    collection do
      get 'list'
      get 'fill_in'end
  end

  namespace :dsp do
    resources :data_carriers
  end

  root 'phonebooks#index'
end
