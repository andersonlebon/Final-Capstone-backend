Rails.application.routes.draw do
  get 'users/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'
  scope :api do
    scope :v1 do
      resources :users
    end
  end
end