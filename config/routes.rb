Rails.application.routes.draw do

  get 'chats/show'
  root to: 'homes#top'
  get '/home/about' => 'homes#about'
  devise_for :users
  resources :books do
    resource :favorites, only: [:create,:destroy]
    resources :book_comments,only:[:create,:destroy]
  end
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only:[:create,:destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

 get '/search' , to: 'searches#search'

 get 'chat/:id', to: 'chats#show', as: 'chat'
 resources :chats, only: [:create]

end