Rails.application.routes.draw do
  resources :topics do
  	resources :posts, except: [:index]
  end
  resources :advertisements, except: [:edit, :update, :destroy]
  resources :questions

  get 'about' => 'welcome#about'
  get 'welcome/contact'
  get 'welcome/faq'

  root 'welcome#index'
end
