Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :properties, only: [:show, :new, :create] do
    get 'search', on: :collection
    resources :price_ranges, only: [:create, :new, :show]
    resources :proposals, only: [:new, :create]
  end
end
