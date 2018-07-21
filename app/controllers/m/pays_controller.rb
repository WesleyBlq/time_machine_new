class M::PaysController < M::BaseController
  layout 'mobile'

  def index
  end

  def charge
  end

  def check
    
  end

  def history
        
  end

  def binding
    unless params[:code].present?
      redirect_uri = wechat_gate_config.config["oauth2_redirect_uri"] + binding_m_pays_path
			return redirect_to wechat_gate_config.oauth2_entrance_url(scope: "snsapi_userinfo", state: "CURENT_STATE", redirect_uri: redirect_uri)  
		end

		valid_info = wechat_gate_config.oauth2_access_token(params[:code])
		@user_info = wechat_gate_config.oauth2_user(valid_info["access_token"], valid_info["openid"])
		session[:openid] = @user_info["openid"]
		@user_info.delete_if {|key, value| key == "language" or key == "privilege"}
    user = WechatUser.create(@user_info)
  end

  def recived_binding 
    reg = /^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(17[0,3,5-8])|(18[0-9])|166|198|199|(147))\d{8}$/
    phone = reg.match(params[:phone])
    repeat_phone = reg.match(params[:repeat_phone])

    if !phone.present? or !repeat_phone.present?
      session[:bingding_error_message] = "请输入正确的手机号码"
      return redirect_to error_m_pays_path
    end

    if phone != repeat_phone
      session[:bingding_error_message] = "手机号码不一致"
      return redirect_to error_m_pays_path
    end  

    redirect_to success_m_pays_path  
  end

  def dev_op
  end

  def success
  end

  def error
  end
end