class AddColumnWechatUserAlipayAcount < ActiveRecord::Migration[5.1]
  def change
    add_column :wechat_users, :alipay_acount, :string
  end
end
