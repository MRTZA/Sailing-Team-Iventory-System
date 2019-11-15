Rails.application.routes.draw do
  resources :items
  get 'items/index'
  get 'items/show'
  get 'items/new'
  get 'items/edit'
  post '/items/:id', to: 'items#check_out', as: "items_update"

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users" do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  get "/add" => "users#add", as: "add"
  post "/insert" => "users#insert", as: "insert"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "items#index"
end
