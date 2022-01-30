Rails.application.routes.draw do
  # resources :users, only: [:show]

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    root "home#top"
    get '/user/sign_out' => 'devise/sessions#destroy'
  end
  get "users/show" => "users#show"
  get 'top' => 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
