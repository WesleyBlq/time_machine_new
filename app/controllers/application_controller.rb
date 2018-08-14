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

	def template_url
		'https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=' + wechat_gate_config.access_token
	end

	def template_data ops = {}
		{
			"touser": ops[:openid],
			"template_id":"BxI4rwE_ZAgMFhRx7s0KCfeGGHh8NjkuKEmVv7tAkbs",
			# "url": red_url,  
			"data":{
				"first": {
					"value":"货品重量：" + ops[:weight] + " kg",
					"color":"#173177"
				},
				"keyword1": {
					# "value": rand(99).to_s + '.' + rand(99).to_s  + "元",
					"value": ops[:price]  + "元",
					"color":"#173177"
				},
				"keyword2": {
					"value": Time.new.strftime("%Y年%m月%d日 %H时%M分"),
					"color":"#173177"
				},
				"remark":{
					"value":"注意查收所绑定的支付宝账号。",
					"color":"#173177"
				}
			}
		}.to_json
	end
end
