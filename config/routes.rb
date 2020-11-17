Rails.application.routes.draw do


  
  devise_for :users, controllers: {
    sessions: 'users/sessions', registrations: 'registrations'
  }

  get 'home/index'

  resources :users do 
    resources :addresses, module: :users 
  end

  resources :jobs do 
    resources :addresses, module: :jobs 
  end

  get 'users/profile/:id/choose_role', to: 'users#choose_role', as: "choose_role"
  post 'users/profile/:id/livestock_owner_role', to: 'users#livestock_owner_role'
  post 'users/profile/:id/transporter_role', to: 'users#transporter_role'

  get 'users/profile/:id', to: 'users#profile', as: "profile"
  get 'users/profile/:id/edit', to: 'users#edit_profile', as: "edit_profile"
  get 'users/profile/:id/create_address', to: 'users#create_address', as: "create_user_address"
  post 'users/profile/:id/create', to: 'users#create_profile'
  patch 'users/profile/:id/edit', to: 'users#update_profile'

  get 'users/:id/jobs/', to: 'users#users_jobs', as: "users_jobs"
  # get 'users/:user_id/jobs/:id', to: 'users#users_jobs', as: "users_job"
  # get 'jobs/create', to: 'jobs#create', as: "create_job"

  post 'jobs/:id/accept_job', to: 'jobs#accept_job'
  post 'jobs/:id/complete_job', to: 'jobs#complete_job'
  root to: 'home#index'
end
