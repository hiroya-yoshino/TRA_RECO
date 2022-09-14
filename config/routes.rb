Rails.application.routes.draw do
  
  root to: "public/homes#top"
  get 'admin' => 'public/homes#about'

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    resources :posts, only: [:new, :edit, :update, :show, :update, :destroy]
    resources :post_details
    resources :users, only: [:index, :show, :edit, :update]
    resources :homes, only: [:top]
    resources :reviews, only: [:index, :edit, :update, :destroy]
  end
  
  
  
end
