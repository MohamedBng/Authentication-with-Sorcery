Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'register', to: 'user_registrations#new'
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  delete 'logout', to: 'user_sessions#destroy', as: :logout
  get 'dashboard', to: 'dashboard#show'
  root "home#show"
  get 'register', to: 'user_registrations#new'
  post 'register/user', to: 'user_registrations#create'
end
