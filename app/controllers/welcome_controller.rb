class WelcomeController < ApplicationController
	per_request_react_rails_prerenderer

	def index
		# OAuth 2
		
		unless params[:code].present?
			redirect_to wechat_gate_config.oauth2_entrance_url(scope: "snsapi_userinfo", state: "CURENT_STATE")  
		else
			valid_info = wechat_gate_config.oauth2_access_token(params[:code])
			@user_info = wechat_gate_config.oauth2_user(valid_info["access_token"], valid_info["openid"])
		end

	end
end
