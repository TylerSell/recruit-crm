Rails.application.routes.draw do

  root 'static#home'

  get '/login', to: 'user/sessions#new'
  post '/login', to: 'user/sessions#create'

  get '/logout', to: 'user/sessions#destroy'

  namespace :user do 
    resources :agents, :recruiters, only: [:index, :new, :create, :edit, :update]
  end

  resources :candidates
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
