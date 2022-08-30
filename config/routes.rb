Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :employees, only: [:index, :show]
      resources :contracts, only: [:index, :show]
      resources :companies, only: [:index]
      resources :turns, only: %i[] do
        collection do
          get 'shifts_available'
        end
      end
    end
  end
  post 'refresh', controller: :refresh, action: :create
  post 'signin', controller: :signin, action: :create
  post 'signup', controller: :signup, action: :create
  delete 'signin', controller: :signin, action: :destroy
end
