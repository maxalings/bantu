Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :services, only: [:index, :show] do
    resources :requests, only:[:create]
  end 
  resources :users, only: [:show, :edit, :update]

  get "/profile", to: "profiles#show", as: :profile
  get "/profile/edit", to: "profiles#edit", as: :edit_profile
  patch "/profile", to: "profiles#update", as: :update_profile
  
  get "/profile/change_password", to: "profiles#change_password", as: :change_password
  patch "/profile/update_password", to: "profiles#update_password", as: :update_password
end
