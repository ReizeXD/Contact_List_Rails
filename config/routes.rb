Rails.application.routes.draw do
  get 'sessions/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  # Defines the root path route ("/")
  # root "posts#index"
  
  root to: "static_pages#index"
  
  #Declarando rotas para as páginas estaticas
  get 'sobre', to:'static_pages#sobre'
  get 'contato', to:'static_pages#contato'
  get 'entrar', to: 'sessions#new'
  post 'entrar', to: 'sessions#create'
  delete 'sair', to: 'sessions#destroy'

  resources :contacts
  resources :users, only: [:show, :new, :create, :edit, :update]
  resources :sessions, only: [:new, :create]
end
