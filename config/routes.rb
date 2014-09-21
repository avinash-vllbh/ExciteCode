Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    # devise_scope :user do
      get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
      get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
    end

  #To sign-out the user and destroy the session
  # devise_scope :user do
  #   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  root 'welcome#index'
  resources :blog do
    resources :comments
  end
  resources :palette
  resources :categories, param: :slug

  get '/blog' => 'blog#index'
  post 'blog' => 'blog#create', as: 'create_blog'

  get '/contact' => 'contact#contact'
  post '/contact' => 'contact#create_contact'

  resources :projects, param: :slug
end
