class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def account
    unless params[:type].present? and params[:data].present?
      return  render :json => {state: "error", message: "missing or wrong params"}
      # return  render :plain => "state"
    end
    # byebug
    
    if params[:type] == "query"
      render :plain => Config.device_state
    end

    if params[:type] == "cost"
      content = params[:data]
      price, weight = content.split(",")

  		ali_pay_transfer_account amount: 0.1, payee_account: current_user.alipay_acount
      
      render :plain => Config.device_state
    end
    # render :json => {state: "success", message: "params complete"}
  end

  
  
end