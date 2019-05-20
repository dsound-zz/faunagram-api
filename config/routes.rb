Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: "api/v1/sightings#index"
  
  if Rails.env.development?
    scope format: true, constraints: { format: /jpg|png|gif|PNG/ } do
      get '/*anything', to: proc { [404, {}, ['']] }, constraints: lambda { |request| !request.path_parameters[:anything].start_with?('rails/') }
    end
  end

  # post "/rails/active_storage/direct_uploads", to: "direct_uploads#create"


  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :destroy] do
        resources :comments
      end
        get "/current_user", to: "auth#get_user_from_token"
        post "/login", to: "auth#login"
        put "/users/:id/avatar_upload/",   to: "users#avatar_upload"
      resources :animals, only: [:index, :show, :update]
      resources :sightings, only: [:index, :show, :create, :update, :destroy] do
        resources :comments
      end
        put "/sightings/:id/image_upload/", to: "sightings#image_upload_update"

      resources :comments, only: [:index, :create, :update, :destroy] do
        resources :comments

      end


    end
  end
 
end
