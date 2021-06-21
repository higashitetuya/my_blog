Rails.application.routes.draw do

  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'

  scope :users do

  devise_for :users, skip: :all
  devise_scope :user do
    get 'sign_up' => 'public/registrations#new', as: :new_user_registration
    post '/' => 'public/registrations#create', as: :user_registration
    get 'sign_in' => 'public/sessions#new', as: :new_user_session
    post 'sign_in' => 'public/sessions#create', as: :user_session
    delete 'sign_out' => 'public/sessions#destroy', as: :destroy_user_session
  end

  get 'users' => 'public/users#index', as: :users
  get 'my_page/:id' => 'public/users#show', as: :my_page
  get 'my_page/:id/edit' => 'public/users#edit', as: :my_page_edit
  patch '/' => 'public/users#update', as: :my_page_update

end

  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admin/sign_in' => 'admin/sessions#new', as: :new_admin_session
    post 'admin/sign_in' => 'admin/sessions#create', as: :admin_session
    delete 'admin/sign_out' => 'admin/sessions#destroy', as: :destroy_admin_session
    get 'admin/sign_up' => 'admin/registrations#new', as: :new_admin_registration
    post 'admin' => 'admin/registrations#create', as: :admin_registration
  end

  namespace :admin do
  get '/' => 'homes#top'
  get 'edit' => 'homes#edit', as: :edit
  patch 'update' => 'homes#update', as: :update

  resources :blogs, only: [:create, :new, :edit, :show, :destroy]
  patch 'blogs/:id' => 'blogs#update', as: :blog_update
  end

end