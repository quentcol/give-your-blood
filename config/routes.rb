Rails.application.routes.draw do
  get 'center/index'
  devise_for :users
  root to: "pages#home"
  resources :hospitals
  resources :donors
  resources :centers
  resources :appointments
  resources :centers do
    resources :reviews
  end
  resources :schedules
  resources :days
end
