Rails.application.routes.draw do
    
	namespace :m do
		root 'welcome#index'
		post 'rest_time' => 'welcome#rest_time'
	end


  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	root to: "welcome#index"
end
