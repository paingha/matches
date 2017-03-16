Rails.application.routes.draw do
  

  get 'packages/index'

  get 'tickets/index'
  
  

  get 'blogs/index'

  devise_for :users, :controllers => { registrations: 'registrations' }
 
  root to: "pages#index"
  resources :pages
  resources :announcements
  
  resource :verification, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
