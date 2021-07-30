Rails.application.routes.draw do
  get 'categories/index'
  devise_for :users, :controllers => {registrations: 'registrations'}
  root 'leagues#index'
  resources :leagues 
  resources :votes, only: [:create, :destroy]

  get "/soccer", to: "leagues#soccer"
  get "/car_racing", to: "leagues#car_racing"
  get "/action", to: "leagues#action"
  get "/adventure", to: "leagues#adventure"
  get "/logic", to: "leagues#logic"
  get "/other", to: "leagues#other"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
