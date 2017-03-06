Rails.application.routes.draw do
  get 'verifications/edit'

  devise_for :users, :controllers => { registrations: 'registrations' }
 
  root to: "pages#index"
  resources :pages
  
  resources :verifications, only: [:edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
