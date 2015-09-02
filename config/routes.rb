Rails.application.routes.draw do
  get 'sessions/new'
  get 'static_pages/home'
  get 'schedule' => "static_pages#schedule_qrcode"
  get 'attended/:code' => "activities#attended"

#  resources :users

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  # get '/' => 'static_pages#home'
   root 'static_pages#home'

  namespace :backend do
    get 'dashboard', to:'dashboard#index'
    resources :speakers do
      collection{put :resort}
    end
    resources :users
    resources :sponsors
    resources :posts
    resources :staffs
    resources :conf_events
    resources :attendees do
      collection do
        post :import
      end
    end
    resources :activities do
      collection do
        post :fetch
      end
    end
    get 'events', to:'events#index'
  end

end
