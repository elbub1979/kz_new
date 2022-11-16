Rails.application.routes.draw do
  resources :phonebooks do
    get 'fill_in', on: :collection
    collection do
      get 'list'
    end
  end

  root 'phonebooks#index'
end
