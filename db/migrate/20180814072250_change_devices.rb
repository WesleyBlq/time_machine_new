class ChangeDevices < ActiveRecord::Migration[5.1]
  def change
    change_table :devices do |t|
      t.remove :owner
      t.belongs_to :wechat_user, index: true
    end
  end
end
