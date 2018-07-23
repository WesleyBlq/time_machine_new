class User < ActiveRecord::Base
  
  before_create :randomize_file_name

  has_attached_file :avatar, use_timestamp: false,styles: {
    small: '54x', 
    middle: "360x", 
    big: '800x'
  }

  validates_attachment_presence :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_size :avatar, in: 0..20.megabytes

  private
  def randomize_file_name
    #archives 就是你在 has_attached_file :archives 使用的名字
    extension = File.extname(avatar_file_name).downcase
    #你可以改成你想要的文件名，把下面这个方法的第二个参数随便改了就可以了。
    self.avatar.instance_write(:file_name, "#{Digest::MD5.hexdigest(avatar_file_name)}#{extension}")
  end
end