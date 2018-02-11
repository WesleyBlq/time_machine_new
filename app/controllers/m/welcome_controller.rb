class M::WelcomeController < M::BaseController

  def index
    @flag = true
    @name = "mobile test"    
  end
end
