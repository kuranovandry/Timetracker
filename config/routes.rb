Timetracker::Application.routes.draw do

  devise_for :users
  devise_for :admin

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount FullcalendarEngine::Engine => "/calendar"
  # root to: "rails_admin/main#dashboard"
  root to: "fullcalendar_engine/events#index"

  # root :to => 'events#index'
  resources :questions
  resources :events do 
    collection do 
      get :get_events
    end
    member do
      post :move
      post :resize
    end
  end
end
