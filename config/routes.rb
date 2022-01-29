Rails.application.routes.draw do
  # resources :users, only: [:show]

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'users/show'
  # devise_scope :user do
  #   root "users/sessions#new"
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
