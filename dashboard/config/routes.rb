Rails.application.routes.draw do
  resources :events do
    resources :ticket_types, except: %i[ index show ]
  end
  resources :tickets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
