class M::ZsController < M::BaseController
  layout 'mobile'
  
  def index
  end

  def shop
  end

  def new
  end

  def update_data
    user = User.new(name: "test",avatar: params[:photo])
    if user.save!
      return render json: {status: "ok", message: "上传成功", pic_url: user.avatar.url(:small)}  
    end
    render json: {status: "error", message: "上传失败", pic_url: user.avatar.url(:small)}  
  end

end
