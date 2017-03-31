Rails.application.routes.draw do
  

 

  get 'blog/index'

  get 'blog/new'

  get 'blog/show'

  get 'blog/edit'

  get 'testimonies/index'

  get 'testimonies/show'

  get 'testimonies/new'

  get 'testimonies/edit'

  get 'packages/index'


  get 'blogs/index'

  devise_for :users, :controllers => { registrations: 'registrations' }
 
  root to: "pages#index"
  resources :pages
  resources :tickets do
    resources :comments, module: :tickets
  end
  resources :announcements
  resources :matches
  resource :verification, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
