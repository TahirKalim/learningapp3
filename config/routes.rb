Rails.application.routes.draw do
 devise_for :users,:controllers => { :registrations => "users/registrations" }, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout',:sign_up => 'signup', :edit_user => 'edit'}

  resources :users
  resources :products
  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages/index'
  get 'static_pages/landing_page'
  post 'static_pages/thank_you'
  root 'static_pages#landing_page'

 	

 resources :orders, only: [:index, :show, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 # get 'static_pages/about'
 # get 'static_pages/contact'
  #get 'static_pages/index'
  #get 'static_pages/landing_page'
 # post 'static_pages/thank_you'
 # root 'static_pages#landing_page'