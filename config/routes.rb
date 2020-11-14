Rails.application.routes.draw do


  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get 'home/index'

  resources :users do 
    resources :addresses, module: :users 
  end

  get 'users/profile/:id', to: 'users#profile', as: "profile"
  get 'users/profile/:id/edit', to: 'users#edit_profile', as: "edit_profile"
  get 'users/profile/:id/create', to: 'users#create_profile', as: "create_profile"
  post 'users/profile/:id/create', to: 'users#create_profile'

  root to: 'home#index'
end
