Rails.application.routes.draw do

  namespace :admin do
    resources :orders, only: [:show, :update]
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  
  namespace :admin do
    resources :items, only: [:index, :create, :new, :show, :edit, :update, :destroy]
  end
  
  namespace :admin do
   resources :genres, only: [:index, :create, :edit, :update, :destroy]
  end
  
  devise_for :admin,  skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
