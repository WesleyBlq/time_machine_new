class M::BaseController < ApplicationController
    layout 'react'
    

    private
    def wechat_login?
        # OAuth 2
        return if session[:openid].present?

        unless params[:code].present?
            return redirect_to wechat_gate_config.oauth2_entrance_url(
                scope: "snsapi_userinfo", 
                state: "CURENT_STATE",
                redirect_uri: request.url
            )  
        end

        valid_info = wechat_gate_config.oauth2_access_token(params[:code])
        user_info = wechat_gate_config.oauth2_user(valid_info["access_token"], valid_info["openid"])
        session[:openid] = user_info["openid"]
        
        if !WechatUser.exists?(openid: user_info["openid"])
            # user_info.delete_if {|key, value| key == "language" or key == "privilege"}
            WechatUser.create(user_info)
        end
    end
end