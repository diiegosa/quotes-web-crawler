Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
      end
      get 'crawler', to: 'crawlers#pull'
      get 'quotes/:tag', to: 'quotes#index'
    end
  end
end
