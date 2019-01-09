Rails.application.routes.draw do
  resources :topics do
  	resources :posts, except: [:index]
  	resources :sponsored_posts, except: [:index]
  end
  resources :advertisements, except: [:edit, :update, :destroy]
  resources :questions
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  post 'users/confirm' => 'users#confirm'

  get 'about' => 'welcome#about'
  get 'welcome/contact'
  get 'welcome/faq'

  root 'welcome#index'
end
