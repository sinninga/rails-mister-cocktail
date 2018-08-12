Rails.application.routes.draw do
  root :to => "cocktails#index"

  resources :cocktails, only: [ :show, :new, :create, :destroy ] do
    resources :doses, only: [ :create, :new ]
  end
  resources :doses, only: [ :destroy ]
end
