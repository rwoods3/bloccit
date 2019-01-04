Rails.application.routes.draw do
  resources :topics do
  	resources :posts, except: [:index]
  	resources :sponsored_posts, only: [:show, :new, :edit, :create]
  end
  resources :advertisements, except: [:edit, :update, :destroy]
  resources :questions
  resources :users, only: [:new, :create]

  get 'about' => 'welcome#about'
  get 'welcome/contact'
  get 'welcome/faq'

  root 'welcome#index'
end
