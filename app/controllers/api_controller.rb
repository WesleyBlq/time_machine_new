class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def ticket
    url = CGI.unescape(params[:url]) # 微信中用户访问的页面
    @data = wechat_gate_config.generate_js_request_params(url) # 生成微信JS-SDK所需的jsapi_ticket，signature等等参数供前段js使用
    render content_type: "application/javascript"
  end

  def account
    unless params[:type].present? and params[:data].present?
      return  render :json => {state: "error", message: "missing or wrong params"}
    end
    
    if params[:type] == "query"
      render :plain => Device.device_state
    end

    if params[:type] == "cost"
      content = params[:data]
      price, weight = content.split(",")
      
      if Device.user.present?
        price = price.to_f < 0.1 ? 0.1.to_s : price
        ali_pay_transfer_account amount: price, payee_account: Device.user.alipay_acount
        RestClient.post(template_url, template_data(:openid => Device.user.openid, 
          :price => price,
          :weight => weight))
          
      end
      Device.idle_device
      render :plain => Device.device_state
    end
    # render :json => {state: "success", message: "params complete"}
  end

  
  
end