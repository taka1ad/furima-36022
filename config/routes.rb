Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :buyers, only: [:index, :create]
  end
end
# item1  buyer1
# item2  buyer2
