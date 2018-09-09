class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

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