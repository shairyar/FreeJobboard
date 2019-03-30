require 'sidekiq/web'

Rails.application.routes.draw do
  # Public routes
  root to: 'home#index'
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  resources :notifications, only: [:index]
  resources :announcements, only: [:index]

  # Devise routes
  devise_scope :user do
    get 'users/sign-up-employer', to: 'users/registrations#new', 'employer': true
  end
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: 'users/registrations' }, path_names: { sign_up: 'sign-up-jobseeker' }

  # Job seeker routes

  # Employer routes
  namespace :employers do
    resources :companies do
      resources :jobs
    end
  end

  # Admin routes
  namespace :admin do
      resources :users
      resources :announcements
      resources :notifications
      resources :services

      root to: "users#index"
    end

  authenticate :user, lambda {|u| u.admin?} do
    mount Sidekiq::Web => '/sidekiq'
  end
end
