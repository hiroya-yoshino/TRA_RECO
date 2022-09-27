Rails.application.routes.draw do


  root to: "public/homes#top"
  get 'about' => 'public/homes#about'
  get 'admin' => 'admin/homes#top'

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  get 'users/information/edit' => 'public/users#edit'
  patch 'users/information' => 'public/users#update'
  get 'users/unsubscribe' => 'public/users#unsubscribe'
  patch 'users/withdraw' => 'public/users#withdraw'

  get 'search' => 'public/homes#search'

  namespace :admin do
    resources :posts, only: [:new, :edit, :update, :show, :update, :destroy]
    resources :post_details
    resources :users, only: [:index, :show, :edit, :update]
    resources :homes, only: [:top]
    resources :reviews, only: [:index, :edit, :update, :destroy]
  end

  scope module: :public do
    resources :users, only: [:show] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :posts do
      resources :post_details, only: [:edit, :update, :destroy, :create]
      resources :comments, only: [:create]
      resources :reviews, only: [:index, :new, :create]
    end
  end

  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
  end

end
