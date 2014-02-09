App::Application.routes.draw do

  devise_for :users
  root to: "static#home"

  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      # resources :models, only: [:index, :show, :create, :update, :destroy]
    end
  end

end
