class M::WelcomeController < M::BaseController

	def index
		@flag = true
		@name = "mobile test" 
		rest_date_config = Config.find_by_config_type("rest_date")
		@rest_date = rest_date_config.config_value   
	end

	def rest_time
		rest_date = params[:rest_date]
		# byebug

		rest_date_config = Config.find_by_config_type("rest_date")
		rest_date_config.config_value = rest_date
		# byebug
		rest_date_config.save!

		render :json => {status: "success"}
	end
end
