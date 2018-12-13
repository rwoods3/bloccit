Rails.application.routes.draw do
  resources :advertisements, except: [:edit, :update, :destroy]
  resources :posts
  resources :questions

  get 'about' => 'welcome#about'
  get 'welcome/contact'
  get 'welcome/faq'

  root 'welcome#index'
end
