Rails.application.routes.draw do
  #get 'password_resets/new'

  #get 'password_resets/edit'

  root   'welcome#index'
  get    '/home',    to: 'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  post    '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]

  resources :jobs do
    member do
      post :join
      post :quit
    end
    resources :resumes
    resources :posts
  end

  namespace :account do
    resources :attention_jobs
  end

   namespace :admin do
     resources :jobs do
       member do
         post :publish
         post :hide
       end

       resources :resumes
     end
   end

end
