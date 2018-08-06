class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def account
    unless params[:dev_num].present? and params[:account].present?
      return  render :json => {state: "error", message: "missing or wrong params"}
    end
    render :json => {state: "success", message: "params complete"}
  end

  
end