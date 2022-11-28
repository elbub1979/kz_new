Rails.application.routes.draw do
  devise_for :users

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
