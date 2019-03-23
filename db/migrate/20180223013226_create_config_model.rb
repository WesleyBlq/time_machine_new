class CreateConfigModel < ActiveRecord::Migration[5.1]
  def change
    create_table :configs do |t|
        t.string :config_type
        t.string :config_value
        t.timestamps
    end

    # 创建初始数据
    Config.create(:config_type => "rest_date", :config_value => "20170439")
  end
end
