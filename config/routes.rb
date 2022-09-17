Rails.application.routes.draw do

  root to: "public/homes#top"
  get 'about' => 'public/homes#about'

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  get 'users/my_page' => 'public/users#show'
  get 'users/information/edit' => 'public/users#edit'
  patch 'users/information' => 'public/users#update'
  get 'users/unsubscribe' => 'public/users#unsubscribe'
  patch 'users/withdraw' => 'public/users#withdraw'


  namespace :admin do
    resources :posts, only: [:new, :edit, :update, :show, :update, :destroy]
    resources :post_details
    resources :users, only: [:index, :show, :edit, :update]
    resources :homes, only: [:top]
    resources :reviews, only: [:index, :edit, :update, :destroy]
  end

  scope module: :public do
    resources :posts
    resources :post_details, only: [:new, :edit, :update, :destroy, :create]
    resources :reviews, only: [:index, :new, :create]
    resources :comments, only: [:create]
    resources :follows, only: [:create, :destroy, :index]
  end

end
