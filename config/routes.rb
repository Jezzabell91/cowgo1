Rails.application.routes.draw do


  
  devise_for :users, controllers: {
    sessions: 'users/sessions', registrations: 'registrations'
  }

  get 'home/index'

  resources :users do 
    resources :addresses, module: :users 
  end

  get 'users/profile/:id/choose_role', to: 'users#choose_role', as: "choose_role"
  post 'users/profile/:id/livestock_owner_role', to: 'users#livestock_owner_role'
  post 'users/profile/:id/transporter_role', to: 'users#transporter_role'

  get 'users/profile/:id', to: 'users#profile', as: "profile"
  get 'users/profile/:id/edit', to: 'users#edit_profile', as: "edit_profile"
  post 'users/profile/:id/create', to: 'users#create_profile'
  patch 'users/profile/:id/edit', to: 'users#update_profile'
  root to: 'home#index'
end
