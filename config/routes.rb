Rails.application.routes.draw do
  


  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => { registrations: 'registrations' }
 
  root to: "pages#index"
  resources :pages
  resources :packages
  post 'packages/bronze'
  resources :tickets do
    resources :comments, module: :tickets
  end
  resources :blog do
    resources :comments, module: :blog
  end
  resources :blog
  resources :testimonies
  resources :announcements
  resources :matches
  resource :verification, only: [:new, :create]

  get '/password/reset', to: "devise/passwords#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
