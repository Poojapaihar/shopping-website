Rails.application.routes.draw do
	
  get 'cards/show'
  devise_for :users
	root 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products do
  	resources :orders
  end
  resource :cards, only: [:show]

end
