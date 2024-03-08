Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :hospitals
  resources :donors
  resources :centers do
    resources :reviews
  end
  resources :appointments
  resources :schedules
  resources :days
end