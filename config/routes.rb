Rails.application.routes.draw do
	

  devise_for :admins
	post 'api/account' => 'api#account'
	get 'api/ticket' => 'api#ticket'
	
	resource :wechat, only: [:show, :create]
	namespace :m do
		root 'welcome#index'
		post 'rest_time' => 'welcome#rest_time'

		get 'other/service'

		# 中山国际测试
		get 'zs' => 'zs#index'
		get 'zs/new' => 'zs#new'
		get 'zs/shop' => 'zs#shop'		
		post 'zs/update_data' => 'zs#update_data'
		
		resources :pays, only: [:index] do
			collection do
        get 'charge'
        get 'check'
				get 'history'
				get 'binding'
				get 'success'
				get 'error'
				post 'recived_binding'
				get 'dev_op'
				post 'dev_ajax'
      end
		end
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
