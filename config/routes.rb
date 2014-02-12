App::Application.routes.draw do
  root to: "static#home"

  devise_for :users

  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :widgets, only: [:index, :show]
      resources :users, only: [:create, :show]
    end
  end
end
