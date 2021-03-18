Rails.application.routes.draw do
    namespace :api do
        namespace :v1 do
            resources :login
            resources :comments
            resources :wishes
            resources :rents
            resources :suggestions
            resources :book_suggestions
            resources :users do
                resources :comments
                resources :wishes
                resources :rents
                resources :suggestions
            end
            resources :books do
                resources :comments
                resources :wishes
                resources :rents
                resources :book_suggestions
            end
        end
    end
end
