Rails.application.routes.draw do
  devise_for :users

  resources :products

  resource :cart, only: [:show, :destroy] do
    resource :items, only: [:create, :destroy, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
