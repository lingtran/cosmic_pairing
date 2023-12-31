Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  allow do
    # TODO: this is temp - need to actually configure
    origins 'http://localhost:3006'
    namespace :api do
      namespace :v1 do
        get 'test', to: 'test#index'
      end
    end
  end
end

# rails generate controller api/v1/Recipes index create show destroy -j=false -y=false --skip-template-engine --no-helper