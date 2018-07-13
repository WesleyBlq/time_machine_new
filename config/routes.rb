Rails.application.routes.draw do
    
	resource :wechat, only: [:show, :create]
	namespace :m do
		root 'welcome#index'
		post 'rest_time' => 'welcome#rest_time'
		resource :pay
	end

	namespace :wx do
		root 'welcome#index'
		get 'login' => 'welcome#index'
	end

	namespace :admin do
		root 'admin#index'
	end

  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	root to: "welcome#index"
end
