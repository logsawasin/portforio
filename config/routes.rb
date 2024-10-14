Rails.application.routes.draw do
devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

root to: "users/homes#top"
get 'admin/comments' => 'admins/comments#index'


scope module: :users do
  resources :titles, only: [:index, :show, :edit, :create]
  resources :comments, only: [:index, :show, :create]
  resources :customers, only: [:show, :edit, :update]
end

scope module: :admins do
  resources :titles, only: [:index, :show, :edit,]
  resources :customers, only: [:index, :show, :edit, :update]
end
end
