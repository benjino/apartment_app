Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  resources :users
  root 'apartments#index'

  resources :apartments

  resources :apartments do
    # GET /apartments/:apartment_id/map_locations
    get 'map_location'        # Add this and the "do" "end"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
