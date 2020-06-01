Rails.application.routes.draw do

  root 'static#home'

  get '/login', to: 'user/sessions#new'
  post '/login', to: 'user/sessions#create'

  get '/logout', to: 'user/sessions#destroy'

  get '/stage_1', to: 'stages#stage_1'
  get '/stage_2', to: 'stages#stage_2'
  get '/stage_3', to: 'stages#stage_3'
  get '/stage_4', to: 'stages#stage_4'
  get '/stage_5', to: 'stages#stage_5'
  get '/stage_6', to: 'stages#stage_6'
  get '/stage_7', to: 'stages#stage_7'
  get '/stage_8', to: 'stages#stage_8'
  get '/stage_9', to: 'stages#stage_9'
  get '/stage_10', to: 'stages#stage_10'

  # namespace :user do 
  #   resources :agents, :recruiters, only: [:index, :new, :create, :show, :edit, :update]
  # end

  get '/auth/facebook/callback' => 'user/sessions#facebook'

  scope '/user' do 
    resources :agents, only: [:new, :create, :show, :edit, :update] do
      resources :candidates, only: [:index, :new, :create]
    end
    resources :recruiters, only: [:new, :create, :show, :edit, :update] do
      resources :candidates, only: [:index, :new, :create]
    end
  end 

  resources :candidates, only: [:show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
