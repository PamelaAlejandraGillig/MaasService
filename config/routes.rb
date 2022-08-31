Rails.application.routes.draw do
  post 'refresh', controller: :refresh, action: :create
  post 'signin', controller: :signin, action: :create
  post 'signup', controller: :signup, action: :create
  delete 'signin', controller: :signin, action: :destroy
  get 'currentuser', controller: :users, action: :get_user
  namespace :api do
    namespace :v1 do
      resources :contracts, only: [:index, :show]
      resources :companies, only: [:index]
      resources :turns, only: %i[] do
        collection do
          get 'shifts_available'
          get 'get_turns'
        end
      end
      resources :registrations, only: %i[] do
        collection do
          post 'create_massive'
        end
      end
    end
  end
end
