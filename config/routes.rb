Rails.application.routes.draw do
  get 'users/profile'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get 'home/index'

  root to: 'home#index'
end
