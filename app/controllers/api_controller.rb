class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def account
    unless params[:type].present? and params[:data].present?
      return  render :json => {state: "error", message: "missing or wrong params"}
      # return  render :plain => "state"
    end
    # byebug
    
    if params[:type] == "query"
      render :plain => Device.device_state
    end

    if params[:type] == "cost"
      content = params[:data]
      price, weight = content.split(",")
      
      if Device.owner.present?
  		  ali_pay_transfer_account amount: 0.1, payee_account: Device.owner
      end
      Device.idle_device
      render :plain => Device.device_state
    end
    # render :json => {state: "success", message: "params complete"}
  end

  
  
end