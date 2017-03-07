Rails.application.routes.draw do
  

  get 'blogs/index'

  devise_for :users, :controllers => { registrations: 'registrations' }
 
  root to: "pages#index"
  resources :pages
  
  resource :verification, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
