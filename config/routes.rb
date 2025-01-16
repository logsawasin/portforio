Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations], controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  root to: "users/homes#top"
  get 'top' => 'users/homes#top'
  get 'admin/comments' => 'admins/comments#index'

  scope module: :users do
    resources :games, only: [:index, :show, :edit, :create, :update]
    resources :users, only: [:show, :edit, :update]
      resources :strategies, only: [:index, :create, :show, :edit, :update, :new, :destroy] do 
        resources :comments, only: [:index, :show, :create, :destroy]
      end
  end

  namespace :admins do
    get 'top' => 'homes#top', as: 'top'
    resources :games, only: [:index, :show, :edit, :update, :create, :new, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
    resources :comments, only: [:index, :show, :destroy, :create]
    resources :strategies, only: [:index, :show, :edit, :update, :create, :new, :destroy]
  end
end
