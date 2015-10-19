Rails.application.routes.draw do
  root :to => 'questions#index'

  resources :questions do
    resources :answers
  end

  resources :users

  get "/log-in" => "sessions#new", as: :log_in
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out
end
