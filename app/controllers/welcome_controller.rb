class WelcomeController < ApplicationController
	per_request_react_rails_prerenderer

	def index
		# OAuth 2
		
		unless params[:code].present?
			return redirect_to wechat_gate_config.oauth2_entrance_url(scope: "snsapi_userinfo", state: "CURENT_STATE")  
		end
		valid_info = wechat_gate_config.oauth2_access_token(params[:code])
		@user_info = wechat_gate_config.oauth2_user(valid_info["access_token"], valid_info["openid"])
		@result = RestClient.post(template_url, template_data(@user_info["openid"]))
	end

	private
	def template_url
		'https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=' + wechat_gate_config.access_token
	end

	def template_data openid
		data = {
			"touser": openid,
			"template_id":"BxI4rwE_ZAgMFhRx7s0KCfeGGHh8NjkuKEmVv7tAkbs",
			"url":"http://www.baidu.com",  
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
end
