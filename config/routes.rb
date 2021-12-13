Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope :api do
    scope :v1 do
      resources :sessions, only: [:create, :destroy]
      resources :users  do
        resources :reservations
        resources :houses
      end
    end
  end
end