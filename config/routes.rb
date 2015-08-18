Rails.application.routes.draw do
  get 'sessions/new'
  get 'static_pages/home'
  get 'static_pages/schedule_qrcode' => "static_pages#schedule_qrcode"

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
  end


end
