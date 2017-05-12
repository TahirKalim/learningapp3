Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, :controllers => { :registrations => "my_registrations" }, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout', :sign_up => 'register'}
  
  resources :users
  resources :products do
    resources :comments
  end

  get 'static_pages/index'

  get 'static_pages/about'

  get 'static_pages/contact'

  post 'static_pages/thank_you'

  get 'static_pages/landing_page'
  
  root 'products#index'

  resources :orders, only: [:index, :show, :create, :destroy]
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
