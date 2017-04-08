Rails.application.routes.draw do
  


  devise_for :users, :controllers => { registrations: 'registrations' }
 
  root to: "pages#index"
  resources :pages
  resources :packages
  resources :tickets do
    resources :comments, module: :tickets
  end
  resources :blog
  resources :testimonies
  resources :announcements
  resources :matches
  resource :verification, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
