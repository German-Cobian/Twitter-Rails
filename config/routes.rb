Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  resources :tweets, only: [:show, :create] do
    resources :likes, only: [:create, :destroy]
    resources :bookmarks, only: [:create, :destroy]
    resources :retweets, only: [:create, :destroy]
    resources :reply_tweets, only: :create
  end

  get :dashboard, to: "dashboard#index"
  get :profile, to: "profile#show"
  put :profile, to: "profile#update"

  resources :usernames, only: [:new, :update]
  resources :users, only: :show do
    resources :followings, only: [:create, :destroy]
  end

  resources :bookmarks, only: :index

  # path will redefinethe hashtags path as explore
  resources :hashtags, only: [:index, :show], path: "/explore"
  resources :message_threads, only: :index, path: "/messages"

end
