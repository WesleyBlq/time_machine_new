class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  self.wechat_gate_app_name = 'nanyang_recycle'
  
  def current_user
      WechatUser.find_by(openid: session[:openid]) 
  end

  private
	def ali_pay_transfer_account ops
		# alipay
		client = Alipay::Client.new(
			url: ENV['ALIPAY_API'],
			app_id: ENV['APP_ID'],
			app_private_key: ENV['APP_PRIVATE_KEY'],
			alipay_public_key: ENV['ALIPAY_PUBLIC_KEY'],
		)

		out_biz_no = Time.now.strftime("%Y%m%d%H%M%S%L") << (0..9).to_a.shuffle.join
		response = client.execute(
			method: 'alipay.fund.trans.toaccount.transfer',
			biz_content: {
				out_biz_no: out_biz_no,
				payee_type: 'ALIPAY_LOGONID',
				payee_account: ops[:payee_account],
				amount: ops[:amount].to_s,
			}.to_json(ascii_only: true)
		)
		# => '{\"alipay_fund_trans_toaccount_transfer_response\":{\"code\"...'
		
		# 取得转帐ID
		ali_order_id = JSON.parse(response)["alipay_fund_trans_toaccount_transfer_response"]["order_id"]
		{ :ali_order_id => ali_order_id, :out_biz_no => out_biz_no }
	end
end
