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
    resources :games, only: [:index, :show, :edit, :create]
    resources :comments, only: [:index, :show, :create]
    resources :customers, only: [:show, :edit, :update]
    resources :strategy, only: [:create, :show, :edit, :update]
  end

  namespace :admins do
    get 'top' => 'homes#top', as: 'top'
    resources :games, only: [:index, :show, :edit, :update, :create, :new, :destroy]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :comments, only: [:index, :show]
  end
end
