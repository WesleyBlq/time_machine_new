class WelcomeController < ApplicationController
	# per_request_react_rails_prerenderer

	def index
		

		# @result = RestClient.post(template_url, template_data(@user_info["openid"]))

		# alipay
		# @client = Alipay::Client.new(
		# 	url: ENV['ALIPAY_API'],
		# 	app_id: ENV['APP_ID'],
		# 	app_private_key: ENV['APP_PRIVATE_KEY'],
		# 	alipay_public_key: ENV['ALIPAY_PUBLIC_KEY'],
		# 	sign_type: 'RSA',
		# )

		# @response = @client.execute(
		# 	method: 'alipay.fund.trans.toaccount.transfer',
		# 	biz_content: {
		# 		# out_biz_no: rand(9999999).to_s,
		# 		out_biz_no: "1",
		# 		payee_type: 'ALIPAY_LOGONID',
		# 		payee_account: 'wdaifr8692@sandbox.com',
		# 		amount: '100'
		# 	}.to_json(ascii_only: true)
		# )
		# => '{\"alipay_fund_trans_toaccount_transfer_response\":{\"code\"...'

		# 取得转帐ID
		# @result_order_id = JSON.parse(@response)["alipay_fund_trans_toaccount_transfer_response"]["order_id"]
		#
	end

	private
	def template_url
		'https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=' + wechat_gate_config.access_token
	end

	def template_data openid, red_url
		{
			"touser": openid,
			"template_id":"BxI4rwE_ZAgMFhRx7s0KCfeGGHh8NjkuKEmVv7tAkbs",
			"url": red_url,  
			"data":{
				"first": {
					"value":"您获得了一笔新的佣金。",
					"color":"#173177"
				},
				"keyword1": {
					"value": rand(99).to_s + '.' + rand(99).to_s  + "元",
					"color":"#173177"
				},
				"keyword2": {
					"value": Time.new.strftime("%Y年%m月%d日 %H时%M分"),
					"color":"#173177"
				},
				"remark":{
					"value":"请点击详情领取",
					"color":"#173177"
				}
			}
		}.to_json
	end

	def redpack_template
		{
			"appkey": wechat_gate_config.config["jfy_appkey"],
			"method": "jfy.redpacks.send",
			"openid": session[:openid],
			"money": 30,
			"nickname":"阿宝",
		}.to_json
	end
end
