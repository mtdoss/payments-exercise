Rails.application.routes.draw do
  resources :loans, defaults: {format: :json} do
    resources :payments, defaults: {format: :json}, only: :index
  end
  resources :payments, only: [:show, :create]
end
