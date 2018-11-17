Rails.application.routes.draw do
    get 'issues/show'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'page#welcome' 
	get '/about' => 'page#about'
	#issues
	get '/issues/new' => 'issues#new'
	get '/issues/:id' => "issues#show", :as => "issue"
	delete 'issues/:id' => 'issues#destroy'
	get 'issues' => 'issues#index', :as => 'issues'
	post 'issues' => 'issues#create'
	get 'issues/:id/edit' => 'issues#edit', :as => 'edit_issue'
	patch 'issues/:id' => 'issues#update'

	#comments
	resources :comments, only: [:create]

	#users
	get 'signup' => 'users#signup', :as =>'signup'
	post 'signup' => 'users#create', :as => 'signup_create'
	get 'login' => 'users#login', :as => 'login'
	post 'login_create' => 'users#login_create'
	delete 'logout' => 'users#logout', :as => 'logout'
end
