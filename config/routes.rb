Rails.application.routes.draw do
  devise_for :users, path: '/', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register' 
  },
  controllers: {
    registrations: :register,
    omniauth_callbacks: :omniauth_callbacks
  }
  
  root 'home#index'
  resources :login
  resources :register

  put 'user/choose_tool/:tool', to: 'home#choose_tool'

  resources :upload_csv
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
