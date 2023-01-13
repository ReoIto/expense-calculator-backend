Rails.application.routes.draw do
  namespace :api, format: "json" do
    namespace :v1 do
      resources :groups, only: [:show, :create, :update]
    end
  end
end
