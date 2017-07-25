Rails.application.routes.draw do
  get 'map/view'

  get 'map/share'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "map#view"

  post 'map/shareLocation'
end
