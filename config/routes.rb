Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope :api do
    scope :v1 do
      resources :sessions, only: [:create, :destroy]
      resources :users, only: [:create] do
        resources :reservations, only: [:index, :create, :destroy]
        resources :houses, only: [:index, :create, :destroy, :show]
      end
    end
  end
end