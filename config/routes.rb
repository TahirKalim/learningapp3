Rails.application.routes.draw do
  resources :products
 
	get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  root 'static_pages#index'
 
 resources :orders, only: [:index, :show, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
