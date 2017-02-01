Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :products
  resource :cart, only: [:show, :destroy] do
    resources :items, only: [:create, :destroy], controller: :cart_items do
      member do
        get :increase_count
        get :decrease_count
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
