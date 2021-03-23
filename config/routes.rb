Rails.application.routes.draw do
  resources :activities, only: [:index, :show, :new, :create]
  resources :campers, only: [:index, :show, :new, :create]
  resources :signups, only: [:new, :create, :show, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
