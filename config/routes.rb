Rails.application.routes.draw do
  get 'about_us/index', to: 'about_us#index'
  get 'center/index'
  devise_for :users
  root to: "pages#home"
  resources :hospitals
  resources :donors
  resources :centers do
    resources :reviews
  end
  resources :appointments do
    member do
      get :cancel
      get :approve
      get :deny
    end
  end
  resources :schedules
  resources :days
end
