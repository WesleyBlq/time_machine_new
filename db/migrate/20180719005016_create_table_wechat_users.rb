class CreateTableWechatUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :wechat_users do |t|
      t.string :openid, unique: true
      t.string :nickname, :city, :province, :country, :headimgurl
      t.integer :sex
      t.timestamps null:false
    end

    create_table :bills do |t|
      t.belongs_to :wechat_users, index: true
      t.float :price
      t.timestamps null:false
    end
  end
end
