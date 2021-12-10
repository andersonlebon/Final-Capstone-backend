Rails.application.routes.draw do
  get 'reservations/index'
  get 'houses/index'
  get 'users/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'
  scope :api do
    scope :v1 do
      resources :users  do
        resources :reservations
        resources :houses
      end
    end
  end
end