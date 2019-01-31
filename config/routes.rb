Rails.application.routes.draw do
  resources :items
  resources :users
  post 'signin', to: 'users#signin'
  get 'validate', to: 'users#validate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
